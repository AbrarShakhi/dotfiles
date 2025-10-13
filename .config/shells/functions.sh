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

detect_shell() {
  if [ -n "$ZSH_VERSION" ]; then
    echo "zsh"
  elif [ -n "$BASH_VERSION" ]; then
    echo "bash"
  elif [ -n "$FISH_VERSION" ]; then
    echo "fish"
  else
    echo "unknown"
  fi
}
