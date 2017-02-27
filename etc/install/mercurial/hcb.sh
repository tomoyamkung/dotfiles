#!/bin/bash -eu

# ライブラリスクリプトを読み込む
. ~/dotfiles/etc/lib/dry_run.sh

function usage() {
  cat <<EOF 1>&2

Description:
  $(basename ${0}) は "hg commit --close-branch" を実行するスクリプトである。

Usage:
  $(basename ${0}) [<options>]

Options:
  -h  print this
  -x  dry-run モードで実行する
EOF

  exit 1
}

while getopts hx OPT
do
  case "$OPT" in
    h) usage
       ;;
    x) enable_dryrun
       ;;
    \?) usage
        ;;
  esac
done

# FZF を使ってブランチを絞り込む
branch_name=$(hg branches | fzf --exit-0 --select-1 --ansi)
# 存在しないブランチを指定された場合は処理を終了する
if [[ -z ${branch_name} ]]; then
  exit 2
fi
# 不要な文字を取り除く
branch_name=$(echo ${branch_name} | awk '{print $1}')

# `hg update` を実行する
${dryrun} hg update "${branch_name}"
# 指定したブランチを閉鎖する
${dryrun} hg commit --close-branch -m "close branch ${branch_name}"
exit 0
