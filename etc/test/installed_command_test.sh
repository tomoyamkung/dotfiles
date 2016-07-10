#!/bin/bash

# dotfiles/etc/test 直下に移動する
cd `dirname $0`

# テスト対象のスクリプトを読み込む
source ../lib/installed_command.sh

# `ls` コマンドは存在するので `$? = 0` になるはず
installed_command ls 
if [ ! $? -eq 0 ]; then
    echo "ls コマンドは存在します"
fi

# `dummy_command` コマンドは存在しないので `$? != 0` になるはず
installed_command dummy_command 
if [ $? -eq 0 ]; then
    echo "dummy_command コマンドは存在しません"
fi

# 別解
installed_command ls || echo "ls はインストールされているはずです"
installed_command dummy_command && echo "dummy_command はインストールされていないはずです"
