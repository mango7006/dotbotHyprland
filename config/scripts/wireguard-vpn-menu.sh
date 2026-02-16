#!/usr/bin/env bash

options=$(
  cat <<EOF
RPI-Home
US-FREE-55
NL-FREE-213
NL-FREE-79
EOF
)

# 44 pixels per entry
pixels=$(($(echo "$options" | wc -l) * 50))

# Show wofi menu
choice=$(echo -e "$options" | wofi -H $pixels --sort-order=default --cache-file=/dev/null -d)

# Run only if something was chosen
if [ -n "$choice" ]; then
  kitty --class terminalfloatsmall ~/.config/scripts/wireguard-master.sh toggle "$choice"
fi
