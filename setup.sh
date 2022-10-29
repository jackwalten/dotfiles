#!/bin/sh

mkdir -p $HOME/.local/bin $HOME/.config $HOME/.config/zsh

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf <<EOF
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbOptions" "caps:escape"
EndSection
EOF

# Some systems copy the default bash configuration files from /etc/skel directory which we do not need
[ -f $HOME/.bashrc ] && rm $HOME/.bashrc
[ -f $HOME/.bash_profile ] && rm $HOME/.bash_profile
[ -f $HOME/.profile ] && rm $HOME/.profile
[ -f $HOME/.bash_history ] && rm $HOME/.bash_history
[ -f $HOME/.bash_logout ] && rm $HOME/.bash_logout

stow -D */
stow */
