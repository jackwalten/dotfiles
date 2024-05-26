# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
unsetopt NOMATCH				 # No annoying "Sorry this command is not found"
setopt INTERACTIVE_COMMENTS
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
setopt GLOB_DOTS

stty -ixon <$TTY >$TTY           # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')     # Extremely annoying highlight when pasting.

# Colors
autoload -Uz colors && colors
eval $(dircolors)

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=$XDG_CACHE_HOME/.zhistory
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt APPEND_HISTORY            # Append history to history file.
setopt INC_APPEND_HISTORY_TIME   # Write to history file upon command completion.

# Basic auto/tab complete:
zmodload zsh/complist
autoload -Uz compinit ; compinit -d ${XDG_CACHE_HOME:-$HOME/.cache}/.zcompdump
_comp_options+=(globdots)        # Include hidden files.
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/.zcompcache"
zstyle ':completion:*' rehash true
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Bash completions
autoload -U +X bashcompinit && bashcompinit

# fzf
if [ -f /usr/share/fzf/completion.zsh ] ; then . /usr/share/fzf/completion.zsh ; fi
if [ -f /usr/share/fzf/key-bindings.zsh ] ; then . /usr/share/fzf/key-bindings.zsh ; fi

# Vim mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
bindkey "^?" backward-delete-char           # Fix Backspace key in insert mode

# Source important files
source $ZDOTDIR/zsh-aliases
source $ZDOTDIR/zsh-functions

# Prompt
zsh_add_theme romkatv/powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Zoxide
if command -v zoxide 1>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# Plugins
zsh_add_plugin zsh-users/zsh-completions
zsh_add_plugin zsh-users/zsh-syntax-highlighting
zsh_add_plugin zsh-users/zsh-autosuggestions
