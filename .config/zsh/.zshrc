
[[ "$-" != *i* ]] && return

HISTSIZE=1024                                        		# max history to 1024
SAVEHIST="$HISTSIZE"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
HISTFILE="$HOME/.cache/.cmd_hist"                    		# zsh_history, bash_history to cache

autoload -U colors && colors
autoload -U compinit && compinit

PS1=":: %{$fg[yellow]%}[%{$reset_color%} %{$fg[green]%}%1~%{$reset_color%} %{$fg[yellow]%}]%{$reset_color%} %b "
if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
fi

export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $fg[green]$USER    :$fg[white]"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-fordward

alias -s c=nvim
alias -s cpp=nvim
alias -s txt=vim
alias -s py=python3
