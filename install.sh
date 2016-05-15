#!/bin/bash

# カレントディレクトリにある . ファイルに対してホームディレクトリにシンボリックリンクを作成する
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv `pwd`/"$f" ~/"$f"
done

# カレントディレクトリにある bin ディレクトリに対してホームディレクトリにシンボリックリンクを作成する
ln -snfv `pwd`/bin ~/bin

