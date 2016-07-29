#!/bin/bash

# dotfiles 直下に移動する 
cd `dirname $0`; cd ../../

# ライブラリスクリプトを読み込む
source etc/lib/exist_dir.sh

# 環境に ~/.vim/dein ディレクトリが存在していれば終了
exist_dir ~/.vim/dein && exit 1

# dein.vim をインストールする
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.vim/dein

exit 0
