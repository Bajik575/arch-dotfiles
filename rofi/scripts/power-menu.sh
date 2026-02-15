#!/bin/bash

CHOICE=$(echo -e "poweroff\nreboot\nsuspend\nhibernate\nlock\nlogout" | rofi -dmenu -p "power" -i)

case "$CHOICE" in
    "poweroff") shutdown now ;;
    "reboot") reboot ;;
    "suspend") systemctl suspend ;;
    "hibernate") systemctl hibernate;;
    "lock") hyprlock ;;
    "logout") hyprctl dispatch exit ;;
esac
