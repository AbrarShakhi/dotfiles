
# [ -e $XDG_CONFIG_HOME/zsh/.zprofile ] && source $XDG_CONFIG_HOME/zsh/.zprofile

[[ "$-" != *i* ]] && return

HISTSIZE=1024                                        		# max history to 1024
SAVEHIST="$HISTSIZE"
HISTFILE="$HOME/.cache/.cmd_hist"                    		# zsh_history, bash_history to cache

autoload -U colors && colors
PS1=":: %{$fg[yellow]%}[%{$reset_color%} %{$fg[green]%}%1~%{$reset_color%} %{$fg[yellow]%}]%{$reset_color%} %%b "


setopt autocd
setopt interactive_comments

setopt INC_APPEND_HISTORY

export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER    :$fg[white]"

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v

echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

pk() {
  pgrep -i "$1" | sudo xargs kill -9
}



alias -s c=nvim
alias -s cpp=nvim
alias -s txt=vim
alias -s sh=nvim
alias -s py=nvim

# source bash_aliases file
[ -e ~/.misc/.bash_aliases ] && source ~/.misc/.bash_aliases

