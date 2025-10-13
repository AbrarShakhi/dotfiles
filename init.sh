#!/bin/sh

# Exit if stow does not exist
if ! command -v stow >/dev/null 2>&1; then
    echo "Could not find 'stow'. Please install 'stow'."
    exit 1
fi


git submodule update --init --recursive


echo "Stow is installed. Proceeding with setup..."

# Create necessary directories if they do not exist
echo "Checking for necessary directories..."
[ ! -d ~/.local/apps ] && echo "Creating '~/.local/apps'..." && mkdir -p ~/.local/apps
[ ! -d ~/.local/share/bin ] && echo "Creating '~/.local/share/bin'..." && mkdir -p ~/.local/share/bin
[ ! -d ~/.cache ] && echo "Creating '~/.cache'..." && mkdir -p ~/.cache

# Create directories that should not be symlinked directly
echo "Checking for configuration directories..."
[ ! -d ~/.config ] && echo "Creating '~/.config'..." && mkdir -p ~/.config
[ ! -d ~/.config/Code/User ] && echo "Creating '~/.config/Code/User'..." && mkdir -p ~/.config/Code/User

# Ask user for confirmation before removing ~/.local/bin
if [ -d ~/.local/bin ]; then
    echo "'~/.local/bin' already exists. Are you sure you want to remove it? This will delete all contents in ~/.local/bin."
    read -p "Type 'yes' to proceed, or any other key to cancel: " response
    if [ "$response" != "yes" ]; then
        echo "Aborted. '~/.local/bin' was not removed."
        exit 1
    fi
    echo "Removing '~/.local/bin'..."
    rm -rf ~/.local/bin
    echo "'~/.local/bin' has been removed."
fi

# Run stow to symlink the current directory's contents into target locations
echo "Running 'stow' to create symlinks from the current directory..."
stow .
echo "Symlinks have been created."
