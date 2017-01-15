#!/bin/bash -eu
#
# @(#) create_dir.sh ver.1.0.0 2016/12/30
#
# Usage:
#   $ create_dir.sh path/to/dir
#     path/to/dir: 作成したいディレクトリのパス
#
# Description:
#   ディレクトリを作成する関数。
#   指定したディレクトリの存在確認を行い、存在する場合は何もしない。
#   引数の確認は行わないので注意すること。
#
###########################################################################

function create_dir() {
  if [ -d "$1" ]; then
    return 1  # ディレクトリが存在していたので何もしない
  fi

  mkdir -p "$1"
  return 0
}
