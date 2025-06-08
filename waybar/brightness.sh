#!/bin/bash

BRIGHT=$(brightnessctl -m | awk -F, '{print $4}')
notify-send -r 9993 -t 1000 -h string:x-canonical-private-synchronous:volume "Brightness" "${BRIGHT}"
