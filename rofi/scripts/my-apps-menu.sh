#!/bin/bash
options="alacritty\nnemo\nchrome\nfirefox\ncode\nobsidian\nayugram\nsteam"
selection=$(echo -e $options | rofi -dmenu -p "my-apps")

case "$selection" in
    "alacritty") alacritty ;;
    "nemo") nemo;;
    "chrome") google-chrome ;;
    "firefox" firefox ;;
    "code") code ;;
    "obsidian") obsidian ;;
	"ayugram") AyuGram ;;
	"steam") steam ;;
esac
