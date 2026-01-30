#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"
THEME="$HOME/.config/walsec/wallpapers.rasi"

# Ambil list wallpaper dan buat format icon untuk Rofi
selected=$(find "$WALL_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -exec basename {} \; | sort | while read -r file; do
    echo -en "$file\0icon\x1f$WALL_DIR/$file\n"
done | rofi -dmenu -i -p "󰸉" -theme "$THEME")

if [ -n "$selected" ]; then
    feh --bg-fill "$WALL_DIR/$selected"
    echo "feh --bg-fill '$WALL_DIR/$selected'" > ~/.fehbg
    notify-send "Wallpaper Updated" "$selected" -i "$WALL_DIR/$selected"
fi