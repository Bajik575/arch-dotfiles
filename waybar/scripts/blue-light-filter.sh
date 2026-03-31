#!/bin/bash
ACTION=$1

TEMP_FILE="/home/bajik575/.config/waybar/scripts/blue-light-temp"
STEP=250
MIN_TEMP=1000
MAX_TEMP=7500

if [[ ! -f "$TEMP_FILE" ]]; then
    echo "2500" > "$TEMP_FILE"
fi

current_temp=$(cat "$TEMP_FILE")

# Change
if [[ "$ACTION" == "up" ]]; then
    new_temp=$((current_temp + STEP))
else
    new_temp=$((current_temp - STEP))
fi

# Limits
[[ $new_temp -lt $MIN_TEMP ]] && new_temp=$MIN_TEMP
[[ $new_temp -gt $MAX_TEMP ]] && new_temp=$MAX_TEMP

# Save
echo "$new_temp" > "$TEMP_FILE"

# Apply
killall gammastep 2>/dev/null
gammastep -O "$new_temp" -P "$new_temp" &

# Send signal to waybar
pkill -SIGRTMIN+8 waybar
