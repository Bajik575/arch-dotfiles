#!/bin/bash

CHOICE=$(echo -e "Poweroff\nReboot\nSuspend\nLogout\nLock" | rofi -dmenu -p "power" -i)

case "$CHOICE" in
    "Poweroff") shutdown now ;;
    "Reboot") reboot ;;
    "Suspend") systemctl suspend ;;
    "Logout") hyprctl dispatch exit ;;
    "Lock") hyprlock ;;
esac
