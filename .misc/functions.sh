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
