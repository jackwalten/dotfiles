export QT_QPA_PLATFORMTHEME=qt5ct

typeset -U path PATH
path=(~/.local/bin $path)
export PATH

export LESSHISTFILE=-

export GOPATH=$HOME/.local/go
export GOBIN=$HOME/.local/go/bin

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export TERM="xterm-256color"
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=xfce4-terminal
export BROWSER=brave
