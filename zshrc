
## LANG
export LANG=ja_JP.UTF8

## set prompt
PROMPT='[%n@%m %c]# '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS  # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS  # 履歴中の重複行をファイル記録前に無くす
setopt HIST_FIND_NO_DUPS  # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS  # 余分な空白は詰めて記録
setopt HIST_NO_STORE  # histroy コマンドは記録しない
setopt SHARE_HISTORY  # share command history data

## Keybind configuration
bindkey -e

## Historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## extended_glob
setopt extended_glob
typeset -A abbreviations
abbreviations=(
  # Other
  "pd" "pushd"
  "la" "ll -a"
  "less" "less -XF"
)
magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}
no-magic-abbrev-expand() {
  LBUFFER+=' '
}
zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand


## autoload
autoload -U compinit
compinit


## alias


## ~/bin
if [ -d ~/bin ]; then
    for d in `ls ~/bin`
    do
        # echo ~/bin/$d
        PATH=$PATH:~/bin/$d
    done
fi

