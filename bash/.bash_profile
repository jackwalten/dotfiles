#
# ~/.bash_profile
#
export QT_QPA_PLATFORMTHEME=qt5ct

export PATH=$PATH:$HOME/.local/bin

export LESSHISTFILE=-
export HISTCONTROL=ignoredups:erasedups

export GOPATH=$HOME/.local/go
export GOBIN=$HOME/.local/go/bin

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export TERM="xterm-256color"
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=xfce4-terminal
export BROWSER=brave

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep xfce4 || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

[[ -f ~/.bashrc ]] && . ~/.bashrc
