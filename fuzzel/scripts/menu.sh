#!/bin/bash
SCRIPTS=~/.config/fuzzel/scripts

if pgrep -x "swayidle" > /dev/null; then
  INHIBITOR_STATUS="idle_inhibitor: on"
  TOGGLE_CMD="pkill swayidle"
else
  INHIBITOR_STATUS="idle_inhibitor: off"
  TOGGLE_CMD="swayidle -w timeout 600 hyprlock timeout 605 'niri msg action power-off-monitors' before-sleep hyprlock &"
fi

CHOICE=$(printf "power\ncontrol-apps\nemoji\nwallpapers\n%s" "$INHIBITOR_STATUS" | fuzzel --dmenu)

case "$CHOICE" in
    "power") $SCRIPTS/power-menu.sh ;;
    "control-apps") $SCRIPTS/control-apps.sh ;;
    "emoji") bemoji ;;
    "wallpapers") $SCRIPTS/wallpapers-selector.sh ;;
    "$INHIBITOR_STATUS") eval "$TOGGLE_CMD" ;;    
esac
