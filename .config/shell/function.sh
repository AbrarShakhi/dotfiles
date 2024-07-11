#!/bin/sh


function mnt_d {
	sudo mount -t drvfs D: /mnt/d
}

cd() {
	z $1 && eza --color=always --icons=always
}

fvim() {
	nvim $(fzf --preview='cat {}')
}

cprun() {
    g++ -static -DAbrarShakhi -lm -s -x c++ -Wall -Wextra -O2 -std=c++17 -o bin $1.cpp && ./bin
}
