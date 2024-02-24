#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

DIR="$HOME/Pictures/Wallpapers"
PICS=($(ls "$DIR"))

RANDOMPICS="${PICS[$RANDOM % ${#PICS[@]}]}"

if pidof swww >/dev/null; then
  pkill swww
fi

wait

# swww init
swww img "${DIR}/${RANDOMPICS}" --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &
wait

wal -i "${DIR}/${RANDOMPICS}"
wait

killall swaync
wait
swaync

pywalfox update
