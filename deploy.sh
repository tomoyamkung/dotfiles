#!/bin/bash

# dotfiles 直下に移動する
cd `dirname $0`

# zplug をインストールする
# dotfiles/etc/deploy にあるスクリプトを実行する
DEPLOY_SCRIPT_DIR=etc/deploy
for F in `ls $DEPLOY_SCRIPT_DIR`
do
    [ -f $DEPLOY_SCRIPT_DIR/$F ] && sh $DEPLOY_SCRIPT_DIR/$F
done
