#!/bin/bash -eu

# ライブラリスクリプトを読み込む
. ~/dotfiles/etc/lib/dry_run.sh

function usage() {
  cat <<EOF 1>&2

Description:
  $(basename ${0}) は "hg commit --close-branch" を実行するスクリプトである。
  ブランチを閉鎖する際のコミットメッセージはデフォルトで以下の形式となっている。
    - close branch BRANCH_NAME
  コミットメッセージを変更する場合は -m オプションを指定する。
    - コミットメッセージが空白を含む場合はクォートで囲むこと

Usage:
  $(basename ${0}) [-h] [-m commit_message] [-x]

Options:
  -h  print this
  -m  ブランチを閉鎖する際のコミットメッセージを指定する
  -x  dry-run モードで実行する
EOF

  exit 1
}

while getopts hm:x OPT
do
  case "$OPT" in
    h) usage
       ;;
    m) commit_message="$OPTARG" ;;
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

# コミットメッセージが未設定の場合はデフォルトを設定する
if [[ -z "${commit_message}" ]]; then
  commit_message="close branch ${branch_name}"
fi

# `hg update` を実行する
${dryrun} hg update "${branch_name}"
# 指定したブランチを閉鎖する
${dryrun} hg commit --close-branch -m "${commit_message}"
exit 0
