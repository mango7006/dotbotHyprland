#!/usr/bin/env bash

TEMP=$(curl -s https://gadgets.buienradar.nl/gadget/weathersymbol | grep -oP 'title="Huidige temperatuur: \K[0-9]+(\.[0-9]+)?' | awk '{print $0 "°C"}')

ICON=$(curl -s "wttr.in/?format=%c")

echo $TEMP$ICON
