#!/bin/bash

# dotfiles 直下に移動する 
cd `dirname $0`; cd ../../

# ライブラリスクリプトを読み込む
source etc/lib/exist_dir.sh

# 環境に ~/.vim/dein ディレクトリが存在しなければ終了
exist_dir ~/.vim/dein || exit 1

# ~/.vimrc に設定が存在すれば終了
grep -q "dein Scripts" ~/.vimrc
[ `echo $?` -eq 0 ] && exit 2

# 環境に dein.vim はインストールされているが ~/.vimrc に設定が欠けているので挿入
cp ~/.vimrc ~/.vimrc.old
cp etc/deploy/dein/dein.vim ~/.vimrc
cat ~/.vimrc.old >> ~/.vimrc
rm ~/.vimrc.old

exit 0
