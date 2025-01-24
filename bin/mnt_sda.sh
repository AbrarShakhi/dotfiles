#!/bin/sh

LOCA="/run/media/$USER/"

# Check if USER is set, $1 is provided, and the directory $LOCA exists
if [ -n "$USER" ] && [ -n "$1" ] && [ -d "$LOCA" ] && [ ! -d "$LOCA/$1" ]; then
    echo "making dir in: $LOCA/$1"
    sudo mkdir -p "$LOCA/$1"
    echo "mounting /dev/$1 to $LOCA/$1"
    sudo mount "/dev/$1" "$LOCA/$1"
else
    echo "(Safely Aborted) Error: USER is not set or argument is missing or directory $LOCA does not exist."
    exit 1
fi
