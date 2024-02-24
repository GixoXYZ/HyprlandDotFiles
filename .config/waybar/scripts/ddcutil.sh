#!/bin/bash

# Get current brightness value for VCP code 0x10
current_brightness=$(ddcutil getvcp 10 | grep -oP 'current value =\s+\K\d+' | tr -d '\n')

if [ "$current_brightness" -gt 15 ]; then
    # Brightness is greater than 15, set it to 15%
    ddcutil setvcp 10 15
    new_brightness=15
    echo "Night"
    exit 0
else
    # Brightness is 15 or lower, set it to 80%
    ddcutil setvcp 10 80
    new_brightness=80
    echo "Day"
    exit 0
fi
