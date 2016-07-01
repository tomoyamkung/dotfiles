#
# zsh/011_git_diff-highlight.zsh
#
# Git のバージョン 2.9.0 から利用できるようになった diff-highlight を PATH に通すためのスクリプト
DH_PATH=`sudo find / -name "diff-highlight" | head -1`
export PATH=$PATH:$DH_PATH

