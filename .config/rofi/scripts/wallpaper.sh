#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

theme="$HOME/.config/rofi/styles/launcher.rasi"

wallpapers=$HOME/Pictures/Wallpapers
image="$(ls $wallpapers | rofi -dmenu -i -p "Select wallpaper" -theme ${theme})"
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

# swww init
swww img $wallpaper --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &
wait

wal -i $wallpaper
wait

killall swaync
wait
swaync

pywalfox update
