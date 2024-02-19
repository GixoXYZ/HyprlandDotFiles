#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

DIR="$HOME/Pictures/Wallpapers"
PICS=($(ls "$DIR"))

RANDOMPICS="${PICS[$RANDOM % ${#PICS[@]}]}"

if pidof swww >/dev/null; then
  pkill swww
fi

wait

# Check if the lock file exists (indicating wal -i is running)
if [ -f "$HOME/.wal_lock" ]; then
  # Wait for wal -i to finish (indicated by absence of the lock file)
  while [ -f "$HOME/.wal_lock" ]; do
    sleep 1
  done
fi

# swww init
swww img "${DIR}/${RANDOMPICS}" --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &

wait

# Create the lock file to indicate that wal -i is running
touch "$HOME/.wal_lock"

# wal command runs after swww is finished
wal -i "${DIR}/${RANDOMPICS}" --cols16

wait

# Remove the lock file to indicate that wal -i has finished
rm -f "$HOME/.wal_lock"

pywalfox update
