#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-1'

wallpapers=$HOME/Pictures/Wallpapers
image="$(ls $wallpapers | rofi -dmenu -i -p "Select wallpaper" -theme ${dir}/${theme}.rasi)"
wallpaper=$wallpapers/$image

if [[ -d $wallpapers/$image ]]; then
  echo "$wallpapers/$image is a directory"
  wallpaper_temp="$image"
  sleep2
  wallpaper_location="$(ls $wallpapers/$image | wofi -n --show dmenu -k "/dev/null")"
elif [[ -f $wallpapers/$image ]]; then
  echo "$wallpapers/$image is a file"
else
  echo "$wallpapers/$image is not valid"
  exit 1
fi

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
swww img $wallpaper --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &

wait

# Create the lock file to indicate that wal -i is running
touch "$HOME/.wal_lock"

# wal command runs after swww is finished
wal -i $wallpaper
wait

# Remove the lock file to indicate that wal -i has finished
rm -f "$HOME/.wal_lock"

pywalfox update
