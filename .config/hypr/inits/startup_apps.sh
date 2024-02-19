#!/bin/bash

# Block middle click paste
# xmousepasteblock &

# Delayed startups
sleep 10

nekoray &
env QT_QPA_PLATFORM=xcb megasync &
telegram-desktop &
discord &
crow &
