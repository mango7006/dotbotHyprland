#!/usr/bin/env bash

# Define menu options
options=$(
  cat <<EOF
Shutdown
Suspend
Reboot
EOF
)

# Show wofi menu
choice=$(echo -e "$options" | wofi -H 130 --dmenu --prompt "Select Action")

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
