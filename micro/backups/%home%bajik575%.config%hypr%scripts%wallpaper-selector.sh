#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
SELECTED=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | \
    while read -r file; do
        basename "${file%.*}"
    done | \
    rofi -dmenu -p "Wallpaper: ")
FULL_PATH=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | \
    grep -E "$(echo "$SELECTED" | sed 's/ /| /g')" | head -1)

if [[ -n "$FULL_PATH" && -f "$FULL_PATH" ]]; then
    swww img "$FULL_PATH" --transition-type any --transition-duration 1 --transition-fps 120
    echo "$FULL_PATH" > ~/.config/hypr/.current-wallpaper
fi
