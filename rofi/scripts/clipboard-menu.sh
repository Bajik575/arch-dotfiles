#!/bin/bash

# rofi
CHOICE=$(cliphist list | rofi -dmenu -p "clip board" \
    -theme-str 'entry { }' \
    -theme-str 'listview { lines: 15; }' \
    -i -fuzzy -width 600)

# Если выбрано - копируем обратно
if [ -n "$CHOICE" ]; then
    echo "$CHOICE" | cliphist decode | wl-copy
fi
