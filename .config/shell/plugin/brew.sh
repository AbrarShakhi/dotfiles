eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(zoxide init zsh)"
source <(fzf --zsh)
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh
