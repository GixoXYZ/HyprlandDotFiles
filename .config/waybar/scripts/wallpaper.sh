#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

DIR=$HOME/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

if [[ $(pidof swww) ]]; then
  pkill swww
fi

# swww init
swww img ${DIR}/${RANDOMPICS} --transition-type wipe --transition-fps 60 --transition-duration 0.3 --transition-angle 30 --transition-step 90
sleep 0.3
wal -i ${DIR}/${RANDOMPICS} --cols16
pywalfox update
pywal-discord -t default
wal-telegram --wal

. $HOME/.config/mako/update-colors.sh
. $HOME/.config/spicetify/Themes/Pywal/update-colors.sh
. $HOME/.config/cava/scripts/update-colors.sh
