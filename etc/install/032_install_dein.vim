#!/bin/bash

# dotfiles 直下に移動する 
cd `dirname $0`; cd ../../

# ライブラリスクリプトを読み込む
source etc/lib/exist_dir.sh
source etc/env/path

# 環境に ~/.vim/dein ディレクトリが存在していれば終了
exist_dir $DEIN_PATH && exit 1

# dein.vim をインストールする
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh $DEIN_PATH

exit 0
