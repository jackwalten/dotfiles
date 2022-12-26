# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# man zshoptions
HISTFILE="$HOME/.cache/history"
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory

setopt auto_pushd
setopt pushd_silent
setopt pushd_to_home
setopt pushd_ignore_dups
setopt pushd_minus

setopt auto_menu
setopt autocd
setopt interactive_comments
unsetopt nomatch

stty -ixon <$TTY >$TTY             # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# fzf
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# aliases and functions
source ~/.config/shell/aliases
source ~/.config/shell/functions

# colors
autoload -U colors && colors

# completions
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' use-cache on
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit
_comp_options+=(globdots)        # Completion for hidden files

# fzf
[ -f $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# plugins
fpath+=$ZDOTDIR/plugins/zsh-completions/src

# prompt
# PROMPT='%F{208}%n%f in %F{226}%~%f -> '
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT='${vcs_info_msg_0_}'
# # PROMPT='${vcs_info_msg_0_}%# '
# zstyle ':vcs_info:git:*' formats '%b'



# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

set -o vi
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh