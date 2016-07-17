#!/bin/bash

# dotfiles/etc/test 直下に移動する
cd `dirname $0`

# テスト対象のスクリプトを読み込む
source ../lib/exist_dir.sh

# ~/dotfiles ディレクトリは存在するので `$? = 0` になるはず
exist_dir ~/dotfiles
if [ ! $? -eq 0 ]; then
    echo "~/dotfiles ディレクトリは存在するはずです"
fi

# ~/hoge ディレクトリは存在しないので `$? != 0` になるはず
exist_dir ~/hoge
if [ $? -eq 0 ]; then
    echo "~/hoge ディレクトリは存在しないはずです"
fi

# 別解
exist_dir ~/dotfiles || echo "~/dotfiles ディレクトリは存在するはずです"
exist_dir ~/hoge && echo "~/hoge ディレクトリは存在しないはずです"
