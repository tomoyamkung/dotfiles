#!/bin/bash -eu
#
# @(#) hst.sh ver.1.0.0 2016/12/30
#
# Usage:
#   - 変更を確認する場合: hst.sh
#   - Mercurial の管理下にファイルを追加する場合: hst.sh -a
#   - ファイルの変更を確認する場合: hst.sh -d
#   - ファイルの変更を戻す場合: hst.sh -r
#
# Description:
#   Mercurial の hg コマンドを補助するスクリプト。
#
###########################################################################

usage() {
    script_name=`basename $0`
    echo "Usage: $script_name     ## check status" 1>&2
    echo "Usage: $script_name -a  ## add file" 1>&2
    echo "Usage: $script_name -d  ## diff file" 1>&2
    echo "Usage: $script_name -r  ## revert file" 1>&2
    exit 3
}

# `hg` のコマンドを格納する変数
# スクリプトのオプションで指定する
command=""
while getopts adrh OPT
do
    case "$OPT" in
        a) command="add"
            ;;
        d) command="diff"
            ;;
        r) command="revert"
            ;;
        h) usage
            ;;
        \?) usage
            ;;
    esac
done

# 変数 $command がブランクの場合は `hg st` を実行する
if [ "$command" == "" ]; then
    hg st
    exit 0
fi

# それ以外の場合は FZF で対象となるファイルを絞り込んで `hg add/diff/revert` を実行する
#   fzf --exit-0: 絞り込む要素が存在しない場合に fzf インタフェースを立ち上げずに終了する
#   fzf --select-1: 絞り込む要素が１つしか存在しない場合に fzf インタフェースを立ち上げずに終了する
#   fzf --ansi: 絞り込みを色付けして表示する
file_name=$(hg st | fzf --exit-0 --select-1 --ansi)
# 存在しないファイルを指定された場合は処理を終了する
[[ -z ${file_name} ]] && exit 2

file_name=$(echo ${file_name} | awk '{print $2}')
hg ${command} ${file_name}
exit 0
