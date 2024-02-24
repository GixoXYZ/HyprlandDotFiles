#!/bin/bash

if [ -f "/usr/bin/swayidle" ]; then
    echo "swayidle is installed."
    # Turn off screen automatically on idle.
    swayidle -w timeout 120 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &
    # Enable inhibit_idle when playing audio.
    exec sway-audio-idle-inhibit &
else
    echo "swayidle is not installed."

fi
