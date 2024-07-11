#!/bin/sh

function palias {
    if command -v $2 &> /dev/null; then
        alias $1=${3}
    else
        echo "${2} is not installed."
    fi
}



alias ..='cd ..'
alias ...='cd ../..'

alias c='clear'
alias cls="clear"
alias md="mkdir"

palias cat bat 'bat'

palias xcp xclip 'xclip -i -sel c'
palias xput xclip 'xclip -o -sel c'
palias yat xclip 'xclip -sel c'

palias l eza "eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
palias ls eza "eza --color=always --icons=always"

palias ff fzf "fzf --preview='cat {}'"
