#!/bin/bash
SCRIPTS=~/.config/fuzzel/scripts
CHOICE=$(echo -e "pulsemixer\nbluetui\nwifitui" | fuzzel --dmenu)
case "$CHOICE" in
	"pulsemixer") $TERMINAL -e pulsemixer ;;
	"bluetui") $TERMINAL -e bluetui ;;
	"wifitui") $TERMINAL -e wifitui ;;
esac
