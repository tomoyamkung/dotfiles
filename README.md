# README.md

インストール・デプロイコマンドは以下の通り。

```sh
$ sh install.sh
$ source ~/.zshrc
```

## 2016/07/01

### [git] git diff で末尾に ^M が表示されないよう設定を追加

dotfiles/gitconfig に以下の設定を追加。

```
[core]
  whitespace = cr-at-eol
```


### [git] ~/.gitconfig を作成するスクリプトを追加

プロジェクトに紐付かない共通で使える Git の設定ファイルをホームディレクトリに作成するスクリプトを作成。

  - dotfiles/etc/deploy/030_deploy_git

設定ファイルのパスは以下の通り。

  - dotfiles/gitconfig


## 2016/06/23

### [git] ブランチ移動を行うスクリプトを追加

以下の記事に乗っていたスクリプトを dotfiles/bin/git/gch として作成。

  - [gitのブランチ移動（checkout）を楽にするやつ - Qiita](http://qiita.com/amichang/items/5f7e715801771214430e)

`gch` を実行することで起動。

```sh
[vagrant@localhost dotfiles]# gch
Branch list:
1) develop
2) master
Select branch > 
```


## 2016/06/21

### ~/bin/ へのシンボリックリンク作成に -f オプションを付けるように修正

-f を付けない状態の場合、2回目以降のデプロイ実行時に シンボリックリンクが作成できない旨のエラーメッセージが表示されていたことに対する修正。


## 2016/06/20

### dotfiles/etc/env/zshrc も ~/.zshrc に反映するように対応

dotfiles/etc/env/zshrc が存在していた場合に、その内容を ~/.zshrc にも反映するように対応。
dotfiles/etc/env/zshrc は環境ごとの際を記述するスクリプト。


## 2016/06/19

### etc/deploy/ ディレクトリ以下にあるスクリプトのデプロイを自動実行するように対応

以下のスクリプトを自動実行するように dotfiles/install.sh を修正。

```
[vagrant@localhost dotfiles]# tree etc                                                                                                             2 
etc
|-- deploy
|   |-- 010_deploy_bin
|   `-- 020_deploy_zsh
```


## 2016/06/18

### dotfiles/bin/ ディレクトリにあるスクリプトのシンボリックリンクを ~/bin に作成するように対応

以下のスクリプトに実装。

  - dotfiles/etc/deploy/010_deploy_bin
