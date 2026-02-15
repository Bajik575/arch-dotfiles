#!/bin/bash
options="colorpicker\npower\nmy-apps\ntty-apps\nall-apps\nwallpapers\nclipboard"
selection=$(echo -e $options | rofi -dmenu -p "main")

case "$selection" in
"colorpicker") sleep 0.2; hyprpicker | wl-copy ;;
"power") ~/.config/hypr/scripts/rofi-scripts/power-menu.sh ;;
"my-apps") ~/.config/hypr/scripts/rofi-scripts/my-apps-menu.sh ;;
"tty-apps") ~/.config/hypr/scripts/rofi-scripts/tty-apps.sh ;;
"all-apps") rofi -show drun ;;
"wallpapers") ~/.config/hypr/scripts/rofi-scripts/wallpaper-selector.sh ;;
"clipboard") ~/.config/hypr/scripts/rofi-scripts/clipboard-menu.sh ;;
esac
