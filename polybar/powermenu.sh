#!/bin/bash

THEME="$HOME/.config/polybar/powermenu.rasi"

# Opsi Menu (Urutan: Lock, Sleep, Reboot, Shutdown)
options="

󰜉
󰐥"

# Jalankan Rofi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme "$THEME" 2>/dev/null)

case "$chosen" in
    "") i3lock ;;
    "") systemctl suspend ;;
    "󰜉") reboot ;;
    "󰐥") poweroff ;;
esac