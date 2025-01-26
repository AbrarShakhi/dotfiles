# [ -e $HOME/.misc/.profile ] && source $HOME/.misc/.profile

[[ "$-" != *i* ]] && return

HISTSIZE=1024                                        		# max history to 1024
SAVEHIST="$HISTSIZE"
HISTFILE="$HOME/.cache/.cmd_hist"                    		# zsh_history, bash_history to cache
HISTCONTROL=ignoreboth
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
export PROMPT_COMMAND="history -a"
HISTFILESIZE=$HISTSIZE
shopt -s checkwinsize
shopt -s globstar 
shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell

# PS1='\u@\h:\w\$ '
PS1='\[\033[01;32m\]\u\033[00m\] using \[\033[01;35m\]\h\033[00m\] on \[\033[01;34m\]\w\[\033[00m\]\n;\[\033[00m\] '
# if command -v starship > /dev/null; then
#     eval "$(starship init bash)"
# fi
export SUDO_PROMPT="[sudo] password for $USER    :"

COMP_CVS_REMOTE=1
COMP_CONFIGURE_HINTS=1
COMP_TAR_INTERNAL_PATHS=1

[[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
