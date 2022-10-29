#!/bin/sh

mkdir -p $HOME/.local/bin $HOME/.config $HOME/.config/zsh

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

# Some systems copy the default bash configuration files from /etc/skel directory which we do not need
[ -f $HOME/.bashrc ] && rm $HOME/.bashrc
[ -f $HOME/.bash_profile ] && rm $HOME/.bash_profile
[ -f $HOME/.profile ] && rm $HOME/.profile
[ -f $HOME/.bash_history ] && rm $HOME/.bash_history
[ -f $HOME/.bash_logout ] && rm $HOME/.bash_logout

stow -D */
stow */
