# README.md

インストール・デプロイコマンドは以下の通り。

```sh
$ sh install.sh
$ sh deploy.sh
$ source ~/.zshrc
```

## 2016/09/01

### [Vim] ctags のインストールと、ctags に関連する Vim プラグインのインストールに対応

以下を実装。

  - システムに ctags がインストールされていない場合は `yum` を使ってインストールする
  - ctags に関連する以下の Vim プラグインを dein.vim を使ってインストールする
    - tagbar
	- vim-tags
  - ctags のデフォルト設定ファイルを ~/.ctags として設置する


## 2016/08/31

### [Vim] dein.vim を使った neocomplete.vim プラグインのインストールに対応

Vim の以下のプラグインをインストールする仕組みを実装。

  - Shougo/neocomplete.vim
  - Shougo/vimproc.vim


## 2016/08/30

### [Vim] dein.vim を使った content_filetype.vim プラグインのインストールに対応

Vim の以下のプラグインをインストールする仕組みを実装。

  - Shougo/content_filetype.vim


### [Vim] dein.vim を使った Unite.vim プラグインのインストールに対応

Vim の以下のプラグインをインストールする仕組みを実装。

  - Shougo/unite.vim

また、以下のファイルの書式に誤りがあったのを修正。

  - dotfiles/etc/deploy/dein/dein.toml


## 2016/08/21

### [Vim] dein.vim を使った NERDTree プラグインのインストールに対応

Vim の以下のプラグインをインストールする仕組みを実装。

  - scrooloose/nerdtree
  - jistr/vim-nerdtree-tabs


## 2016/08/20

### [Vim] dein.vim を使った vim-airline プラグインのインストールに対応

Vim の以下のプラグインをインストールする仕組みを実装。

  - vim-airline/vim-airline
  - vim-airline/vim-airline-themes


## 2016/08/11

### [Vim] dein.vim を使ったプラグインのインストールに対応

dein.vim を使った Vim のプラグインをインストールする仕組みを実装。
プラグインは以下のディレクトリにインストールされる。

  - ~/.vim/dein/repos


## 2016/07/29

### [Vim] dein.vim の自動インストールに対応

Vim のプラグイン管理ツールである dein.vim をインストールするスクリプトを作成。
インストールスクリプトは以下としている。

  - /tmp/installer.sh

dein.vim のインストールディレクトリは以下としている。

  - ~/.vim/dein

システムに ~/.vim/dein ディレクトリが存在し、かつ、~/.vimrc に設定がなければインストールするようになっている。


### [Vim] プラグインに依存しない設定を実装

プラグインに依存しない Vim の設定を以下のファイルに保存しておけば、デプロイ時に ~/.vimrc に反映するように実装。

  - dotfiles/vimrc


## 2016/07/19

### [Vim] Vim の自動インストールに対応

Github からソースコードを `clone` して Vim をインストールするスクリプトを作成。
ソースコードは以下のディレクトリに `clone` する。

  - /usr/local/vim

システムに Vim がインストールされていない場合のみ実行するようになっている。


## 2016/07/18

### [yum] lua, lua-devel の自動インストールに対応

`yum` を使って以下をインストールするスクリプトを作成。

  - lua
  - lua-devel

いずれもシステムにインストールされていない場合のみ実行するようになっている。


### [fzf, zsh] 移動コマンド fd を追加

`fzf` を使った移動コマンド `fd` を実装。


### [zsh] gd コマンドを削除

dotfile/zshrc ファイルから `gd` コマンドを削除。
`fzf` を使って同様の移動コマンドを実装する予定であるため削除することにした。


### [zsh] zsh のインストールスクリプトを作成

システムに /bin/zsh ディレクトリが存在しない場合に `yum` を使って zsh をインストールする処理を追加。
インストール後は `chsh` を実行するようになっている。
`chsh` は対話式になっているため パスワードと "/bin/zsh" を入力する必要があるが、この部分は自動化していない。


## 2016/07/17

### [fzf, zsh] fzf のインストール判定処理を修正

fzf のインストール判定を「コマンドの有無」から「ディレクトリの有無」に変更。


### インストール・デプロイコマンドを分割

機能の切り分けとバグの原因を切り分けるためにインストール・デプロイ手順を修正。
手順は冒頭にある通り。

スクリプトの切り分けは以下の通り。

  - install.sh
    - 環境にソフトウェアをインストールするためのスクリプト
  - deploy.sh
    - 環境にインストールされているソフトウェアの設定を行うスクリプト


## 2016/07/10

### [fzf, zsh, vim] fzf を使って Vim でファイルを開く関数を追加

カレントディレクトリ以下に存在するファイルを fzf で絞り込み Vim で開く関数を作成。


### [fzf] fzf をインストール処理を追加

環境に fzf がインストールされていない場合に Github からソースコードを `clone` してインストールする機能を実装。
注意点は以下の通り。

  - 環境に `git` がインストールされていること
  - fzf のインストールスクリプトは対話式になっているが、その部分は自動化されていない


## 2016/07/03

### [zsh] 履歴に関する設定を追加

zshrc に以下の設定を追加。

  - setopt HIST_IGNORE_DUPS  # 前と重複する行は記録しない
  - setopt HIST_IGNORE_ALL_DUPS  # 履歴中の重複行をファイル記録前に無くす
  - setopt HIST_FIND_NO_DUPS  # 履歴検索中、(連続してなくとも)重複を飛ばす
  - setopt HIST_REDUCE_BLANKS  # 余分な空白は詰めて記録
  - setopt HIST_NO_STORE  # histroyコマンドは記録しない


## 2016/07/01

### [git] Beautiful diffs を利用するための設定を組み込み

Git のバージョン 2.9.0 で実装された Beautiful diffs を利用するための PATH と設定を組み込んだ。
PATH の追加は以下のスクリプトで行う。

  - dotfiles/zsh_011_git_diff_highlight.zsh

Beautiful diffs の設定は以下のファイルで行う。

  - dotfiles/gitconfig


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
