
DOT_PLUGIN_HOME="$HOME/.local/libs"

# Homebrew
BREW_DIR="/home/linuxbrew/.linuxbrew"
if [ -d $BREW_DIR ]; then
    eval "$($BREW_DIR/bin/brew shellenv)"
fi

# Pyenv
PYENV_ROOT="$DOT_PLUGIN_HOME/pyenv"
if [ -d $PYENV_ROOT ]; then
    export PYENV_ROOT
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# nvm
NVM_DIR="$DOT_PLUGIN_HOME/nvm"
if [ -d $NVM_DIR ]; then
    export NVM_DIR
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Sdkman
SDKMAN_DIR="$DOT_PLUGIN_HOME/sdkman"
if [ -d $SDKMAN_DIR ]; then
    export SDKMAN_DIR
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Rustup
export RUSTUP_HOME="$DOT_PLUGIN_HOME/rustup"
export CARGO_HOME="$DOT_PLUGIN_HOME/cargo"
if [ -d $CARGO_HOME ]; then
. "$CARGO_HOME/env"
fi


