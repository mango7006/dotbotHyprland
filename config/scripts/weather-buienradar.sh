#!/usr/bin/env bash

round() {
  local input="$1"
  printf "%.0f\n" "$input"
}

TEMP=$(curl -s https://gadgets.buienradar.nl/gadget/weathersymbol | grep -oP 'title="Huidige temperatuur: \K[0-9]+(\.[0-9]+)?')

ICON=$(curl -s "wttr.in/?format=%c" | sed 's/+//g; s/C/C /g; s/ //g')

ROUNDED=$(round $TEMP | awk '{print $0 "°C"}')

echo $ROUNDED$ICON
