#!/bin/bash

# dotfiles 直下に移動する
cd `dirname $0`

# zplug をインストールする
# https://github.com/zplug/zplug
#curl -sL get.zplug.sh | zsh

# dotfiles/etc/install にあるスクリプトを実行する
INSTALL_SCRIPT_DIR=etc/install
for F in `ls $INSTALL_SCRIPT_DIR`
do
    sh $INSTALL_SCRIPT_DIR/$F
done
