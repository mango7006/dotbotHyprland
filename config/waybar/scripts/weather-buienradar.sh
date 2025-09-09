#!/usr/bin/env bash

# This script is NL/buienradar only, change the waybar module to be custom/wttrINT for international weather

temp=$(curl -s https://gadgets.buienradar.nl/gadget/weathersymbol | grep -oP 'title="Huidige temperatuur: \K[0-9]+(\.[0-9]+)?')

icon=$(curl -s "wttr.in/?format=%c" | sed 's/+//g; s/C/C /g; s/ //g')

if [[ -z "$icon" ]]; then
  icon=""
fi

if [[ "$icon" == *"please"* ]]; then
  icon=""
fi

rounded=$(printf "%.0f°C" "$temp")

echo "{\"text\":\"$rounded$icon\"}"

## Packages directly used in this script:
# curl (download/receive online thing idk)
