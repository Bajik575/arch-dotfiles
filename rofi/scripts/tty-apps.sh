#!/bin/bash

CHOICE=$(echo -e "audio\nbluetooth\nwifi\nbtop" | rofi -dmenu -p "ctrl" -i)

case "$CHOICE" in
    "audio") foot -e pulsemixer ;;
    "bluetooth") foot -e ~/.cargo/bin/bluetui ;;
    "wifi") foot -e nmtui ;;
    "btop") foot -e btop ;;
esac
