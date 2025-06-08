#!/bin/bash

VOL_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
MUTED=$(echo "$VOL_RAW" | grep -q MUTED && echo "true" || echo "false")
VOL=$(echo "$VOL_RAW" | grep -oP '\d+\.\d+' | awk '{printf "%d", $1 * 100}')

if [ "$MUTED" = "true" ]; then
  notify-send -r 9993 -t 1000 -h string:x-canonical-private-synchronous:volume "Volume" "Muted"
else
  notify-send -r 9993 -t 1000 -h string:x-canonical-private-synchronous:volume "Volume" "${VOL}%"
fi
