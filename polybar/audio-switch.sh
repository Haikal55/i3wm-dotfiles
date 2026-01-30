#!/bin/bash

# Path ke tema Rofi kamu
THEME="$HOME/.config/polybar/audio-menu.rasi"
options="󰋋 Headphones\n󰓃 Line Out"

# Pilih menu
chosen=$(echo -e "$options" | rofi -dmenu -p "Audio" -theme "$THEME")

# Ambil nama Sink yang aktif (biasanya alsa_output.pci-0000_00_1b.0.analog-stereo)
SINK=$(pactl get-default-sink)

case "$chosen" in
    "󰋋 Headphones")
        # Pindah port ke headphones
        pactl set-sink-port "$SINK" analog-output-headphones
        # Memastikan tidak kena mute setelah pindah
        pactl set-sink-mute "$SINK" false
        notify-send "Audio Switch" "Output: Headphones" -i audio-headphones
        ;;
    "󰓃 Line Out")
        # Pindah port ke lineout
        pactl set-sink-port "$SINK" analog-output-lineout
        pactl set-sink-mute "$SINK" false
        notify-send "Audio Switch" "Output: Line Out" -i audio-speakers
        ;;
esac