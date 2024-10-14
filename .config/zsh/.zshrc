autoload -U colors && colors
PS1="%{$fg[blue]%}[%{$reset_color%} %{$fg[green]%}%1~%{$reset_color%} %{$fg[blue]%}]%{$reset_color%}$%b "
setopt autocd
setopt interactive_comments

# Attempt at a pretty password prompt
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER    :$fg[white]"

export HISTSIZE=1024
export SAVEHIST="$HISTSIZE"
export HISTFILE="$HOME/.cache/.zsh_history"
setopt INC_APPEND_HISTORY

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

pk() {
  pgrep -i "$1" | sudo xargs kill -9
}

# source aliasrc file
# [ -e ~/.config/aliasrc ] && source ~/.config/aliasrc

