export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/shells"
export EDITOR="nvim"
export KEYTIMEOUT=1

export HISTSIZE=1024
export SAVEHIST="$HISTSIZE"
export HISTFILE="$HOME/.cache/.cmd_hist"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export SUDO_PROMPT="[sudo] password for $USER  :"

[ -d "/ucrt64/bin" ] && PATH="/ucrt64/bin:${PATH}"
[ -d "${XDG_DATA_HOME}/bin" ] && PATH="${XDG_DATA_HOME}/bin:${PATH}"
[ -d "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"
[ -d "${HOME}/man" ] && MANPATH="${HOME}/man:${MANPATH}"
[ -d "${HOME}/info" ] && INFOPATH="${HOME}/info:${INFOPATH}"

if [ -n "${BASH_VERSION}" ]; then
    export MYSHELL=bash
elif [ -n "${ZSH_VERSION}" ]; then
    export MYSHELL=zsh
else
    exit 0
fi

[ -e "${ZDOTDIR}/plugins.sh" ] && . "${ZDOTDIR}/plugins.sh"

if command -v "ssh-agent" > /dev/null && [ "$OS" != "Windows_NT" ] && [ -n "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi
