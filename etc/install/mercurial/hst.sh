#!/bin/bash -eu

function usage() {
  cat <<EOF 1>&2
Description:
  $(basename ${0}) は以下を実行するスクリプトである（カッコ書きは指定するオプション）。
    1. プロジェクトの変更を確認する（オプションなし）
	2. Mercurial の管理下にファイルを追加する（a オプション）
	3. ファイルの変更を確認する（d オプション）
	4. ファイルの変更を戻す（r オプション）
  オプションを指定しない場合は "hg st" を実行する。
  オプションを指定した場合はいずれも "hg st" した結果を FZF によりファイルを絞り込む仕組みになっている。

Usage:
  $(basename ${0}) [<options>]

Options:
  -a  FZF で絞り込んだファイルを Mercurial の管理下に追加する
  -d  FZF で絞り込んだファイルの変更を確認する 
  -h  print this
  -r  FZF で絞り込んだファイルの変更を戻す
  -x  dry-run モードで実行する
EOF
  exit 1
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
