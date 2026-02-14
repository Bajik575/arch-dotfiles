#!/bin/bash
options="term\nfs\nchrome\ncode\nobsidian\ntg"
selection=$(echo -e $options | rofi -dmenu -p "Select")

case "$selection" in
    "term") alacritty ;;
    "fs") nemo;;
    "chrome") google-chrome ;;
    "code") code ;;
    "obsidian") obsidian ;;
	"tg") AyuGram ;;	
esac
