#!/bin/bash

# Current Theme
theme="$HOME/.config/rofi/styles/powermenu.rasi"


# List USB devices using lsblk
USB_DEVICES=$(lsblk -npo NAME,TYPE,TRAN,LABEL,SIZE | awk '$3=="usb" {print $1,$4,$5}' | sed 's/ / - /')

# Check if USB_DEVICES is empty
if [ -z "$USB_DEVICES" ]; then
    SELECTED_DEVICE=$(echo "No USB disk is connected" | rofi -dmenu -p "No USB disk is connected" -theme ${theme})
else
    # Create a Rofi menu
    SELECTED_DEVICE=$(echo "$USB_DEVICES" | rofi -dmenu -p "Select a USB device to safely remove:" -theme ${theme})

    # Extract the selected device name
    SELECTED_DEVICE_NAME=$(echo "$SELECTED_DEVICE" | cut -d' ' -f1)

    PARTITIONS=($(ls "$SELECTED_DEVICE_NAME"* 2>/dev/null))
    # Check if a device was selected and eject it
    if [ -n "$SELECTED_DEVICE" ]; then
        for PARTITION in "${PARTITIONS[@]}"; do
            udisksctl unmount -b $PARTITION
        done
        udisksctl power-off -b $SELECTED_DEVICE_NAME
    fi
fi
