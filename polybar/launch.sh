#!/usr/bin/env bash

# 1. Matikan semua instance polybar yang sedang jalan
killall -q polybar

# 2. Tunggu sampai proses benar-benar mati
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Jalankan polybar (sesuaikan 'mybar' dengan nama di config.ini kamu)
polybar mybar &

echo "Polybar launched..."