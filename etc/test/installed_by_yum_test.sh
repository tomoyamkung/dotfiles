#!/bin/bash

# dotfiles/etc/test 直下に移動する
cd `dirname $0`

# テスト対象のスクリプトを読み込む
source ../lib/installed_by_yum.sh

# curl-devel は `yum` でインストールされているはずなので `$? = 0` になるはず
installed_by_yum curl-devel
if [ ! $? -eq 0 ]; then
    echo "curl-devel は `yum` でインストールされているはずです"
fi

# hoge は `yum` でインストールされていないはずなので `$? != 0` になるはず
installed_by_yum hoeg
if [ $? -eq 0 ]; then
    echo "hoge は `yum` でインストールされていないはずです"
fi

# 別解
installed_by_yum curl-devel || echo "curl-devel は `yum` でインストールされているはずです"
installed_by_yum hoge && echo "hoge は `yum` でインストールされていないはずです"
