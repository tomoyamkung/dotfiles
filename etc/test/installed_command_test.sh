#!/bin/bash -Ceu

# dotfiles/etc/test 直下に移動する
cd `dirname $0`

# テスト対象のスクリプトを読み込む
. ../lib/installed_command.sh

installed_command ls || echo "ls はインストールされているはずです"
installed_command dummy_command && echo "dummy_command はインストールされていないはずです"
