#!/bin/bash
APP_DIR="$HOME/Desktop"
FILE=$(ls "$APP_DIR" | rofi -dmenu -p "Apps")
[[ -n "$FILE" ]] && "$APP_DIR/$FILE"
