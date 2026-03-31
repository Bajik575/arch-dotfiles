#!/bin/bash
SCRIPTS=~/.config/fuzzel/scripts
CHOICE=$(echo -e "pulsemixer\nbluetui\nnmtui\nsteam\nvscode" | fuzzel --dmenu)
case "$CHOICE" in
	"pulsemixer") $TERMINAL -e pulsemixer ;;
	"bluetui") $TERMINAL -e bluetooth ;;
	"nmtui") $TERMINAL -e nmtui ;;
    "steam") steam ;;
    "vscode") code ;;
esac
