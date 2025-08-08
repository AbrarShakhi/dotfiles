
export XDG_CONFIG_HOME="$HOME/.config"                      # set config HOME
export XDG_DATA_HOME="$HOME/.local/share"                   # set data HOME

export ZDOTDIR="$HOME/.misc"                                # set zsh dot dir
export EDITOR="nvim"                                        # editor to nvim
export KEYTIMEOUT=1

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# include ~/bin, ~/.local/bin, MSYS2:ucrt64/bin
[ -d "/ucrt64/bin" ] && PATH="/ucrt64/bin:${PATH}"
[ -d "${XDG_DATA_HOME}/bin" ] && PATH="${XDG_DATA_HOME}/bin:${PATH}"
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

# if running bash
if [ -n "${BASH_VERSION}" ]; then
    export IM_BASHRC
    [ -e "${ZDOTDIR}/.bashrc" ] && . "${ZDOTDIR}/.bashrc"

elif [ -n "${ZSH_VERSION}" ]; then
    export IM_ZSHRC
    [ -e "${ZDOTDIR}/.zshrc" ] && . "${ZDOTDIR}/.zshrc"
fi

eval "$(ssh-agent -s)" > /dev/null
eval "$(zoxide init ${SHELL##*/})"

# source bash_aliases file
[ -e "${ZDOTDIR}/plugins.sh" ] && . "${ZDOTDIR}/plugins.sh"
[ -e "${ZDOTDIR}/.bash_aliases" ] && source "${ZDOTDIR}/.bash_aliases"
