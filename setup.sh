#!/bin/sh

mkdir -p $HOME/.local/bin $HOME/.config

stow -D */
stow */
