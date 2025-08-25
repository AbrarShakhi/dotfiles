preexec() { echo -ne '\e[5 q' ;}

pk() { pgrep -i "$1" | sudo xargs kill -9 ;}

is_exists() {
  command -v "${1%% *}" >/dev/null 2>&1
}

palias() {
  FROM=$1   # alias name
  TO=$2     # preferred command
  ELSE=$3   # fallback command (optional)

  if is_exists "$TO"; then
    alias "$FROM"="$TO"
  elif [ -n "$ELSE" ]; then
    alias "$FROM"="$ELSE"
  fi
}

sd() {
  local dir
  dir=$(find . -maxdepth 1 -type d ! -name '.' | sed 's|^\./||' | \
    fzf --height=40% --layout=reverse --prompt='Select directory: ' \
        --color=fg:#c0caf5,bg:#1e1e2e,hl:#7aa2f7,fg+:#ffffff,bg+:#3b4261,hl+:#7dcfff) \
    && cd "$dir"
}


git() {
  if [ -z "$GITHUB_KEY" ] || [ ! -f "$GITHUB_KEY" ]; then
    while :; do
      if command -v fzf > /dev/null 2>&1; then
        input_key=$(find ~/.ssh -type f | fzf --height=40% --layout=reverse --prompt='Select your GitHub SSH key: ' --color=fg:#c0caf5,bg:#1e1e2e,hl:#7aa2f7,fg+:#ffffff,bg+:#3b4261,hl+:#7dcfff)
      else
        echo -n "Enter path to your GitHub SSH key: "
        read input_key
      fi
      input_key="${input_key/#\~/$HOME}"
      if [ -f "$input_key" ]; then
        export GITHUB_KEY="$input_key"
        break
      else
        echo "File does not exist at: $input_key"
      fi
    done
  fi

  if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l > /dev/null 2>&1; then
    eval "$(ssh-agent -s)" > /dev/null
  fi

  if ! ssh-add -l | grep -q "$(ssh-keygen -lf "$GITHUB_KEY" | awk '{print $2}')"; then
    ssh-add "$GITHUB_KEY"
  fi

  command git "$@"
}
