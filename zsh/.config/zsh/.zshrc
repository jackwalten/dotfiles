# Download Znap, if it's not there yet.
[[ -f ~/.config/zsh/plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/plugins/zsh-snap

HISTSIZE=10000000000
SAVEHIST=10000000000
HISTFILE="$HOME/.config/zsh/history"
setopt appendhistory
setopt autocd
source ~/.config/zsh/plugins/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure
# eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"
[ -f $HOME/.config/shell/aliases ] && source $HOME/.config/shell/aliases
[ -f $HOME/.config/shell/functions ] && source $HOME/.config/shell/functions

[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"

# `znap source` automatically downloads and starts your plugins.
znap source Tarrasch/zsh-bd
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
