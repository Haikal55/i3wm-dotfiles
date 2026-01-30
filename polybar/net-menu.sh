#!/usr/bin/env bash
# Cek terminal apa yang ada, lalu jalankan nmtui
if command -v alacritty >/dev/null; then
    alacritty -e nmtui
elif command -v kitty >/dev/null; then
    kitty -e nmtui
else
    i3-sensible-terminal -e nmtui
fi
