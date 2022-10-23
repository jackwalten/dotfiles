#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize

bind "set completion-ignore-case on"

HISTSIZE=-1
HISTFILESIZE=-1

# fzf
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# Some good utils
eval "$(starship init bash)"
eval "$(zoxide init bash)"

# Aliases
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias freyr='docker run -it --rm -v $PWD:/data freyrcli/freyrjs'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias yay='paru'
alias cd='z'

# Functions
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

topcmds() {
    history | awk 'BEGIN {FS="[ \t]+|\\|"} { print $3 }' | sort | uniq -c | sort -nr | head -10
}

timebash() { shell=${1-$SHELL}; for i in $(seq 1 10); do time $shell -i -c exit; done; }

joke() {
    curl -s -H "Accept: application/json" https://icanhazdadjoke.com/ | jq ".joke"
}

# Prompt
# PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[1;00m\]\$\[\e[0;00m\] '
