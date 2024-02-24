#!/bin/bash

wallpaper=$1

if pidof swww >/dev/null; then
  pkill swww
fi
wait

swww img "$wallpaper" --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90 &
wait

wal -i "$wallpaper"
wait

killall swaync
wait
swaync

pywalfox update
