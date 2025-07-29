#!/usr/bin/env bash

# This script is NL/buienradar only, change the waybar module to be custom/wttrINT for international weather

TEMP=$(curl -s https://gadgets.buienradar.nl/gadget/weathersymbol | grep -oP 'title="Huidige temperatuur: \K[0-9]+(\.[0-9]+)?')

ICON=$(curl -s "wttr.in/?format=%c" | sed 's/+//g; s/C/C /g; s/ //g')

if [[ -z "$ICON" ]] || [[ "$ICON" == *"Unknown"* ]] || [[ "$ICON" == *"Sorry"* ]]; then
  ICON=""
fi

ROUNDED=$(printf "%.0f°C" "$TEMP")

echo "$ROUNDED$ICON"

## Packages directly used in this script:
# curl (download/receive online thing idk)
