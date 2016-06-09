#
# zsh/020_zplug.zsh
#

# 設定ファイルが存在しなければ何もしない
[ ! -f ~/.zplug/init.zsh ] && exit 1

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    echo; zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

