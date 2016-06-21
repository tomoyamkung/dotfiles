# README.md

インストール・デプロイコマンドは以下の通り。

```sh
$ sh install.sh
$ source ~/.zshrc
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
