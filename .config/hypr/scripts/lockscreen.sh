#!/bin/bash

source "$HOME/.cache/wal/colors.sh"

swaylock \
    --inside-wrong-color "$color2" \
    --ring-wrong-color "$color5" \
    --inside-clear-color "$background" \
    --ring-clear-color "$color2" \
    --inside-ver-color "$color3" \
    --ring-ver-color "$color3" \
    --text-color "$foreground" \
    --ring-color "$background" \
    --key-hl-color "$color5" \
    --bs-hl-color "$color2" \
    --line-color "$color5" \
    --inside-color "$background" \
    --separator-color "$color2" \
    --layout-bg-color="$background" \
    --layout-text-color="$foreground" \
    --fade-in 0.5 &

sleep 3

hyprctl dispatch dpms off
