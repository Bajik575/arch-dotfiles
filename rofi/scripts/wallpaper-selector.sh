#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
mapfile -t FILES < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | sort)
NAMES=()
for file in "${FILES[@]}"; do
    basename="${file##*/}"
    name_without_ext="${basename%.*}"
    NAMES+=("$name_without_ext")
done
SELECTED=$(printf '%s\n' "${NAMES[@]}" | rofi -dmenu -p "Wallpaper: ")
if [[ -n "$SELECTED" ]]; then
    FULL_PATH=""
    for file in "${FILES[@]}"; do
        basename="${file##*/}"
        name_without_ext="${basename%.*}"
        if [[ "$name_without_ext" == "$SELECTED" ]]; then
            FULL_PATH="$file"
            break
        fi
    done
    if [[ -n "$FULL_PATH" && -f "$FULL_PATH" ]]; then
        swww img "$FULL_PATH" --transition-type any --transition-duration 1 --transition-fps 120
        echo "$FULL_PATH" > ~/.config/hypr/.current-wallpaper
    fi
fi
