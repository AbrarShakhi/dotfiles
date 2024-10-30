
export XDG_CONFIG_HOME="$HOME/.config"                      # set HOME
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                       # set zsh dot dir
export EDITOR="nvim"                                        # editor to nvim
export KEYTIMEOUT=1


export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'\


if [ -d "${HOME}/bin" ] ; then
    PATH="${HOME}/bin:${PATH}"
fi

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# if running bash
# if [ -n "${BASH_VERSION}" ]; then
#   if [ -f "${HOME}/.bashrc" ]; then
#     source "${HOME}/.bashrc"
#   fi
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
