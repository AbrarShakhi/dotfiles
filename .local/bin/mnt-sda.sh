#!/bin/sh

LOCA="/run/media/$USER"

show_error() {
    echo "(Safely Aborted) Error:"
    [ -z "$USER" ] && echo " - USER is not set."
    [ -z "$1" ] && echo " - Missing argument for device (e.g., sdb1)."
    [ ! -d "$LOCA" ] && echo " - Mount base directory '$LOCA' does not exist."
    [ -d "$LOCA/$1" ] && echo " - Target directory '$LOCA/$1' already exists."
    [ ! -b "/dev/$1" ] && echo " - Device '/dev/$1' does not exist or is not a valid block device."
    [ ! -w "$LOCA" ] && echo " - Mount point '$LOCA' is not writable."
    exit 1
}

# [ -w "$LOCA" ] && Removed if check $LOCA is writable. It will always be false. Since $LOCA requires sudo.
if [ -n "$USER" ] && [ -n "$1" ] && [ -d "$LOCA" ] && [ ! -d "$LOCA/$1" ] && [ -b "/dev/$1" ] && ! mount | grep -q "/dev/$1"; then
    echo "Making dir in: $LOCA/$1"
    sudo mkdir -p "$LOCA/$1"
    echo "Mounting /dev/$1 to $LOCA/$1"
    sudo mount "/dev/$1" "$LOCA/$1"
else
    show_error "$1"
fi
