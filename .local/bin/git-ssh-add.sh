#!/bin/sh

set -e

# exit if it is Windows
if [ "$OS" = "Windows_NT" ]; then
  exit 1
fi

# Check if ssh-agent is running in this shell
if [ -z "$SSH_AUTH_SOCK" ]; then
  echo 'No ssh-agent is running in this shell.' >&2
  echo "Run the agent:" >&2
  echo '    eval "$(ssh-agent -s)"'
  exit 1
fi

SSH_DIR="$HOME/.ssh"

# Use fzf if available
if command -v fzf > /dev/null 2>&1; then
  input_key=$(find "$SSH_DIR" -type f ! -name '*.pub' 2>/dev/null | fzf \
    --height=40% --layout=reverse --prompt='Select your GitHub SSH key: ')
else
  echo -n "Enter path to your GitHub SSH key: "
  read input_key
fi

# Exit if no key selected
if [ -z "$input_key" ]; then
  echo "❌ No SSH key selected. Exiting."
  exit 1
fi

# Expand ~
input_key="${input_key/#~/$HOME}"

echo "🔑 Adding SSH key: $input_key"
ls -l "$input_key" || {
  echo "❌ Key not found at: $input_key"
  exit 1
}

# Add the key
if ssh-add "$input_key"; then
  echo "✅ SSH key added successfully."
else
  echo "❌ Failed to add SSH key."
  exit 1
fi
