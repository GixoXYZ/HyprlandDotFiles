#!/bin/bash

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=1200
max_height=1000

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Launch yad with calculated width and height
yad --width=$dynamic_width --height=$dynamic_height \
    --center \
    --title="Keybindings" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
"ESC" "Close this Window" "" \
" = " "SUPER KEY (Windows Key)" "(SUPER KEY)" \
"" "" "" \
" D" "App Launcher" "(rofi)" \
" Enter" "Terminal" "(kitty)" \
" E" "File Browser" "(thunar)" \
" W" "Internet Browser" "(firefox)" \
" C" "Code Editor" "(vscode)" \
" N" "Code Editor" "(neovim)" \
"" "" "" \
" T" "Toggle Top Bar" "(waybar)" \
" Shift N" "Toggle Notification Area" "(swaync)" \
" X" "Powermenu" "(rofi)" \
" Shift W" "Wallpaper Select" "(rofi)" \
" V" "Clipboard manager" "(cliphist)" \
" Period" "Emojis" "(rofi-emoji)" \
"" "" "" \
" Shift Q" "Reload Hyprland" "(hyprctl reload)" \
" B" "Turn Off Display" "(hyprctl dispatch dpms off)" \
" L" "Lockscreen" "(swaylock)" \
" Shift R" "Eject All USB Storages" "" \
"" "" "" \
"PrtSc" "Screenshot Active Monitor" "(grim)" \
" PrtSc" "Screenshot Selected Area" "(grim)" \
"" "" "" \
" Ctrl C" "Color Picker (RGB)" "(hyprpicker)" \
" Shift C" "Color Picker (HEX)" "(hyprpicker)" \
" Alt C" "Color Picker (HSV)" "(hyprpicker)" \
"" "" "" \
" Q" "Close Active Window" "(killactive)" \
" Shift F" "Toggle Fullscreen" "(fullscreen)" \
" F" "Toggle Fullscreen with Top Bar" "(fullscreen 1)" \
" Space" "Toggle Floating Mode" "(togglefloating)" \
" P" "Toggle Pseudo Mode" "(pseudo)" \
" S" "Toggle Split Direction" "(togglesplit)" \
" O" "Toggle Opaque Mode" "(toggleopaque)" \
"" "" "" \
"Alt Tab" "Switch to Next Window" "(hyprswitch)" \
"Alt Ctrl Tab" "Switch to Prevoius Window" "(hyprswitch -r)" \
" Shift Tab" "Cycle to Next Window in Current Workspace" "(cyclenext)" \
" Left/Right/Up/Down" "Move Focus in Selected direction" "(movefocus)" \
"" "" "" \
" Left Mouse Click" "Move Selected Window" "(movewindow)" \
" Ctrl Left/Right/Up/Down" "Move Active Window" "(movewindow)" \
" Ctrl H/L/K/J" "Move Active Window" "(movewindow)" \
"" "" "" \
" Right Mouse Click" "Resize Selected Window" "(resizewindow)" \
" Shift Left/Right/Up/Down" "Resize Active Window" "(resizeactive)" \
" Shift H/L/K/J" "Resize Active Window" "(resizeactive)" \
"" "" "" \
" Ctrl 1-0" "Move Window to Workspace 1-10" "(movetoworkspace 1-10)" \
" Ctrl ] or [" "Move to Next or Previous Workspace" "(movetoworkspace -+1)" \
" Alt Left or Right" "Move to Next or Previous Workspace" "(movetoworkspace -+1)" \
" Shift 1-0" "Move Window to Workspace 1-10 Without Following" "(movetoworkspacesilent 1-10)" \
" Shift ] or [" "Move to Next or Previous Workspace Without Following" "(movetoworkspacesilent -+1)" \
"" "" "" \
" 1-0" "Switch to Workspace 1-10" "(workspace 1-10)" \
" Mousewheel" "Cycle Through Workspaces" "(workspace r-+1)" \
" Tab" "Cycle to Next Workspace" "(workspace r+1)" \
" Ctrl Tab" "Cycle to Previous Workspace" "(workspace r-1)" \
"" "" "" \
" G" "Toggle Group Mode" "(togglegroup)" \
" Shift Mousewheel" "Cycle Group Active Window" "(changegroupactive)" \
" Alt Z" "Cycle to Next Group Active Window" "(changegroupactive f)" \
" Ctrl Z" "Cycle to Previous Group Active Window" "(changegroupactive b)" \
"" "" "" \
" Z" "Toggle Special Workspace" "(togglespecialworkspace)" \
" Shift Z" "Move Active Windows to Special Workspace" "(movetoworkspace special)" \
"" "" "" \