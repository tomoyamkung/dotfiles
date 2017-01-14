#!/bin/bash -eu

function usage() {
  cat <<EOF 1>&2
Description:
  $(basename ${0}) は "hg update" を実行するスクリプトである。
  "hg update" 自体のオプションは受け付けない。
  "hg update ブランチ名" としてブランチを移動する目的で使用する。
  移動先のブランチは FZF により絞り込んで指定するため $(basename ${0}) の引数には指定しない。

Usage:
  $(basename ${0})

Options:
  -h        print this
  -x        dry run
EOF
  exit 1
}

dryrun=FALSE
while getopts hx OPT
do
  case "$OPT" in
    h) usage
       ;;
    x) dryrun=TRUE
       ;;
    \?) usage
        ;;
  esac
done

# FZF を使ってブランチを絞り込む
branch=$(hg branches | fzf --exit-0 --select-1 --ansi)
# 存在しないブランチを指定された場合は何もしない
[ $(echo ${branch} | wc -c) -eq 1 ] && exit 2

branch=$(echo ${branch} | awk '{print $1}')
if [ "TRUE" = ${dryrun} ] ; then
  echo "hg update ${branch}"
else
  echo ${branch} | xargs hg update
fi
exit 0
