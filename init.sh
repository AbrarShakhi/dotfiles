#!/bin/sh

# Create sourcable/required directory if not exists 
[ ! -d ~/.local/libs ] && mkdir -p ~/.local/libs
[ ! -d ~/.local/share/bin ] && mkdir -p ~/.local/share/bin
[ ! -d ~/.cache ] && mkdir -p ~/.cache

# Directory that I DO NOT WANT direct symb-link
[ ! -d ~/.config ] && mkdir -p ~/.config
[ ! -d ~/.config/Code/User ] && mkdir -p ~/.config/Code/User

# Directory that I WANT direct symb-link
[ -d ~/bin ] && rm -rf ~/bin
[ -d ~/.misc ] && rm -rf ~/.misc
[ -d ~/quickcode ] && rm -rf ~/quickcode

stow .
