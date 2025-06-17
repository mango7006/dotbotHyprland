#!/usr/bin/env bash

TEMP=$(curl -s https://gadgets.buienradar.nl/gadget/weathersymbol | grep -oP 'title="Huidige temperatuur: \K[0-9]+(\.[0-9]+)?' | awk '{print $0 "°C"}' || echo "Could not resolve")

ICON=$(curl -s "wttr.in/?format=%c" | sed 's/+//g; s/C/C /g; s/ //g')

echo $TEMP$ICON
