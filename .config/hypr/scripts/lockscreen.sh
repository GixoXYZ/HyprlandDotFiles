#!/bin/bash

source "$HOME/.cache/wal/colors.sh"
swww_path="$HOME/.cache/swww/DVI-D-1"
image=$(<"$swww_path")
swaylock --image $image --inside-wrong-color "$color2" --ring-wrong-color "$color5" --inside-clear-color "$background" --ring-clear-color "$color2" --inside-ver-color "$color3" --ring-ver-color "$color3" --text-color "$foreground" --ring-color "$background" --key-hl-color "$color5" --bs-hl-color "$color2" --line-color "$color5" --inside-color "$background" --separator-color "$color2" --layout-bg-color "$background" --layout-text-color "$foreground" & disown

sleep 1

hyprctl dispatch dpms off
