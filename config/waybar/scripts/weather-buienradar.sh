#!/usr/bin/env bash

# This script is NL/buienradar only, change the waybar module to be custom/wttrINT for international weather

temp=$(curl --connect-timeout 5 -s https://gadgets.buienradar.nl/gadget/weathersymbol | grep -oP 'title="Huidige temperatuur: \K[0-9]+(\.[0-9]+)?')

icon=$(curl --connect-timeout 5 -s "wttr.in/?format=%c" | sed 's/+//g; s/C/C /g; s/ //g')

if [[ -z "$temp" ]]; then
  temp="unknown"
else
  rounded=$(printf "%.0f°C" "$temp")
fi

if [[ -z "$icon" ]]; then
  icon=""
fi

if [[ "$icon" == *"please"* ]]; then
  icon=""
fi

echo "$rounded$icon"

## Packages directly used in this script:
# curl (download/receive online thing idk)
