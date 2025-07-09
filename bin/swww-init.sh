#!/bin/bash

# Initialize swww if not already running
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon
    sleep 1 # Give swww time to start
fi

# Set a random wallpaper from ~/local/wallpaper/
WALLPAPER=$(find ~/.local/wallpaper/ -type f | shuf -n1)
swww img "$WALLPAPER"
