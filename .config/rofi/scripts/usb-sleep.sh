#!/bin/bash

# Find and unmount all USB partitions
for device in $(lsblk -npo NAME,TYPE,TRAN | awk '$3=="usb" {print $1}'); do
    partitions=($(ls "$device"* 2>/dev/null))
    for partition in "${partitions[@]}"; do
        echo "Unmounting $partition"
        udisksctl unmount -b "$partition"
    done
    sleep 2
    udisksctl power-off -b "$device"
done

sleep 3
