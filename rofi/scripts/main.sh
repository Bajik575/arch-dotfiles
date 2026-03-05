#!/bin/bash
options="colorpicker\nemoji\npower\nmy-apps\ntty-apps\nall-apps\nwallpapers\nclipboard"
selection=$(echo -e $options | rofi -dmenu -p "main")

case "$selection" in
"colorpicker") sleep 0.2; hyprpicker | wl-copy ;;
"emoji") rofimoji ;;
"power") ~/.config/rofi/scripts/power-menu.sh ;;
"my-apps") ~/.config/rofi/scripts/my-apps-menu.sh ;;
"tty-apps") ~/.config/rofi/scripts/tty-apps.sh ;;
"all-apps") rofi -show drun ;;
"wallpapers") ~/.config/rofi/scripts/wallpaper-selector.sh ;;
"clipboard") ~/.config/rofi/scripts/clipboard-menu.sh ;;
esac
