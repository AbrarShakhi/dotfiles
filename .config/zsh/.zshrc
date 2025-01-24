# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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

# PS1=":: %{$fg[yellow]%}[%{$reset_color%} %{$fg[green]%}%1~%{$reset_color%} %{$fg[yellow]%}]%{$reset_color%} %b "
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER    :$fg[white]"

preexec() { echo -ne '\e[5 q' ;}

pk() { pgrep -i "$1" | sudo xargs kill -9 ;}

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-fordward

alias -s c=nvim
alias -s cpp=nvim
alias -s txt=vim
alias -s py=python3

# source bash_aliases file
[ -e ~/.misc/.bash_aliases ] && source ~/.misc/.bash_aliases
