
DOT_PLUGIN_HOME="$HOME/.local/libs"

# Homebrew
BREW_DIR="/home/linuxbrew/.linuxbrew"
if [ -d $BREW_DIR ]; then
    eval "$($BREW_DIR/bin/brew shellenv)"
else
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Pyenv
PYENV_ROOT="$DOT_PLUGIN_HOME/pyenv"
if [ -d $PYENV_ROOT ]; then
    export PYENV_ROOT
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
else
fi

# nvm
NVM_DIR="$DOT_PLUGIN_HOME/nvm"
if [ -d $NVM_DIR ]; then
    export NVM_DIR
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
fi

# Sdkman
SDKMAN_DIR="$DOT_PLUGIN_HOME/sdkman"
if [ -d $SDKMAN_DIR ]; then
    export SDKMAN_DIR
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Rustip
export RUSTUP_HOME=$DOT_PLUGIN_HOME
export CARGO_HOME=$DOT_PLUGIN_HOME
if [ -d $CARGO_HOME ]; then
. "$CARGO_HOME/env"
fi

# zinit
if [ -n "${ZSH_VERSION}" ]; then
    ZINIT_HOME="${DOT_PLUGIN_HOME}/zinit"

    if [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$ZINIT_HOME"
		git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    fi
	source "${ZINIT_HOME}/zinit.zsh"
	zinit ice depth=1; zinit light romkatv/powerlevel10k
    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-completions
fi
