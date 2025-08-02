#!/usr/bin/env bash

# Define menu options
options=$(
  cat <<EOF
Shutdown
Reboot
Suspend
EOF
)

# Show wofi menu
# 41 pixels per entry, 43 * 3 = 129
choice=$(echo -e "$options" | wofi -H 129 --sort-order=default --cache-file=/dev/null --dmenu --no-actions --prompt "Select Action")

# Run the corresponding command
case "$choice" in
"Shutdown")
  shutdown now
  ;;
"Suspend")
  systemctl suspend
  ;;
"Reboot")
  systemctl reboot
  ;;
*)
  exit 1
  ;;
esac

## Packages directly used in this script:
# wofi (dmenu picker)
