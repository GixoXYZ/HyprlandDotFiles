#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

DIR=$HOME/Pictures/Wallpapers
ACTIVE_WALLPAPER_PATH="$HOME/.cache/active-wallpaper-path"
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

if [[ $(pidof swaybg) ]]; then
  pkill swaybg
fi

sleep 1

swaybg -i ${DIR}/${RANDOMPICS}
wal -i ${DIR}/${RANDOMPICS} --cols16
pywalfox update

echo "${DIR}/${RANDOMPICS}" >"$ACTIVE_WALLPAPER_PATH"
. $HOME/.config/mako/update-colors.sh
. $HOME/.config/spicetify/Themes/Pywal/update-colors.sh
. $HOME/.config/cava/scripts/update-colors.sh
