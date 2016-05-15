
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
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

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


autoload -U compinit
compinit

alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'


## Git
# ZshでGitのカレントブランチを右プロンプトに表示。コミット済みのきれいな状態だと緑色、未コミットの編集がある場合は赤色で表示される。
# http://qiita.com/hash/items/325cffc755fc1ff91928
setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
     color=%F{red}
  fi
  echo "$color$name$action%f%b "
}
RPROMPT='`rprompt-git-current-branch`'

## zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


## ~/bin
if [ -d ~/bin ]; then
    for d in `ls ~/bin`
    do
        # echo ~/bin/$d
        PATH=$PATH:~/bin/$d
    done
fi


