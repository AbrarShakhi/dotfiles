#!/bin/sh

# Define the target directory
TARGET_DIR="$HOME/dotfiles"

find "$HOME" -type l -exec test ! -e {} \; -o -exec readlink -f {} \; | grep "^$TARGET_DIR" | while read symlink;
do
    echo "Removing symlink: $symlink"
    # rm "$symlink"
done
