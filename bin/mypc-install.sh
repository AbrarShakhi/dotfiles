#!/bin/sh

packages=("ghostty" "zsh" "fzf" "stow" "tmux" "swaync" "nvim" "zoxide" "bat" "lsd")
hypr_packages=("hyprland" "hyprlock" "hypridle" "waybar" "swww" "fuzzel" "wl-clip-persist" "swaync" "nautilus" "pamixer" "playerctl" "wlogout" "nwg-look" "impala")

install_or_yay() {
  local pkg=$1
  if pacman -Ss "^${pkg}$" > /dev/null; then
    echo "Installing $pkg from pacman..."
    sudo pacman -S --noconfirm --needed "$pkg"
  else
    echo "$pkg not found in pacman, trying yay..."
    yay -S --noconfirm --needed "$pkg"
  fi
}

install_packages() {
  local pkgs=("$@")
  echo "Installing packages: ${pkgs[*]}"
  sudo pacman -Syyu
  for pkg in "${pkgs[@]}"; do
    install_or_yay "$pkg"
  done
}

if [[ "$1" == "--full" ]]; then
  echo "Installing full package set..."
  install_packages "${packages[@]}" "${hypr_packages[@]}"
else
  echo "Installing basic package set..."
  install_packages "${packages[@]}"
fi

echo "Installation completed."
