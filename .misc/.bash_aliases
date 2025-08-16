
alias cls='clear'

palias cat bat
palias cd z

palias ls lsd
palias l 'lsd --tree --depth=1' 'ls --color=auto --format=single-column'
palias ls 'lsd' 'ls --color=auto'
palias ll 'lsd -alF' 'ls -alF'
palias la 'lsd -A' 'ls -A'
palias lst 'lsd --tree' 'tree'

palias get 'axel'

alias beep='echo -en "\007"'

alias md='mkdir -p'
alias o='less'
alias rd='rmdir'
alias rehash='hash -r'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip --color=auto'

alias unmount='echo "Error: Try the command: umount" 1>&2; false'
alias you='if test "$EUID" = 0 ; then /sbin/yast2 online_update ; else su - -c "/sbin/yast2 online_update" ; fi'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias less='less -r'
alias whence='type -a'

