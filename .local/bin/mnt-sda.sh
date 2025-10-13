#!/bin/sh

LOCA="/run/media/$USER"

echo "Checking preconditions..."

# 1. Check if USER is set
if [ -z "$USER" ]; then
    echo "(Aborted) Error: USER is not set."
    exit 1
fi

# 2. Check if device name argument was given
if [ -z "$1" ]; then
    echo "(Aborted) Error: No device name provided (e.g., sdb1)."
    exit 1
fi

# 3. Check if base mount directory exists
if [ ! -d "$LOCA" ]; then
    echo "(Aborted) Error: Mount base directory '$LOCA' does not exist."
    exit 1
fi

# 4. Check if the target directory already exists
if [ -d "$LOCA/$1" ]; then
    echo "(Aborted) Error: Target directory '$LOCA/$1' already exists."
    exit 1
fi

# 5. Check if the device exists and is a block device
if [ ! -b "/dev/$1" ]; then
    echo "(Aborted) Error: Device '/dev/$1' does not exist or is not a block device."
    exit 1
fi

# 6. Check if the device is already mounted
if mount | grep -q "/dev/$1"; then
    echo "(Aborted) Error: Device '/dev/$1' is already mounted."
    exit 1
fi

# All checks passed, proceed to mount
echo "All checks passed."
echo "Creating mount directory: $LOCA/$1"
sudo mkdir -p "$LOCA/$1"

echo "Mounting /dev/$1 to $LOCA/$1"
sudo mount "/dev/$1" "$LOCA/$1"
