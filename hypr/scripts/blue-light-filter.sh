#!/bin/bash
ACTION=$1

TEMP_FILE="/home/bajik575/.config/waybar/scripts/blue_light_temp"
STEP=250
MIN_TEMP=1000
MAX_TEMP=7500

if [[ ! -f "$TEMP_FILE" ]]; then
    echo "2500" > "$TEMP_FILE"
fi

current_temp=$(cat "$TEMP_FILE")

# Изменяем температуру
if [[ "$ACTION" == "up" ]]; then
    new_temp=$((current_temp + STEP))
else
    new_temp=$((current_temp - STEP))
fi

# Ограничения
[[ $new_temp -lt $MIN_TEMP ]] && new_temp=$MIN_TEMP
[[ $new_temp -gt $MAX_TEMP ]] && new_temp=$MAX_TEMP

# Сохраняем
echo "$new_temp" > "$TEMP_FILE"

# Применяем
killall gammastep 2>/dev/null
gammastep -O "$new_temp" -P "$new_temp" &

# Отправляем сигнал для обновления waybar
pkill -SIGRTMIN+8 waybar
