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
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash

# Some good utils
# eval "$(starship init bash)"
# eval "$(zoxide init bash)"

# Aliases
[ -f $HOME/.config/shell/aliases ] && source $HOME/.config/shell/aliases

# Functions
[ -f $HOME/.config/shell/functions ] && source $HOME/.config/shell/functions

# Prompt
PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[1;00m\]\$\[\e[0;00m\] '
