#!/bin/bash

# Fix running gtk apps on root
exec-once = xhost +SI:localuser:root

## Set GTK Themes, Icons, Cursor and Fonts
THEME='Arc-BLACKEST'
ICONS='Papirus-Dark'
FONT='Ubuntu Semi-Bold 11'
CURSOR='Adwaita'

SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes() {
	${SCHEMA} gtk-theme "$THEME"
	${SCHEMA} icon-theme "$ICONS"
	${SCHEMA} cursor-theme "$CURSOR"
	${SCHEMA} font-name "$FONT"
}

apply_themes
