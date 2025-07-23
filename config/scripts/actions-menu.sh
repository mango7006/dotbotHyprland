#!/usr/bin/env bash

# Define menu options
options=$(
  cat <<EOF
Toggle Recording
Toggle Bluetooth
Toggle Focus Mode
Toggle Wireguard
Toggle Light Filter
Toggle Keyboard Layout
Toggle Network
EOF
)

# Show wofi menu
choice=$(echo -e "$options" | wofi -H 310 --dmenu --prompt "Select Action")

# Run the corresponding command
case "$choice" in
"Toggle Recording")
  ~/.config/scripts/recorder.sh toggle
  ;;
"Toggle Bluetooth")
  bluetooth toggle
  ;;
"Toggle Focus Mode")
  ~/.config/scripts/focus-mode.sh
  ;;
"Toggle Wireguard")
  kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle
  ;;
"Toggle Light Filter")
  if pgrep gammastep >/dev/null; then
    pkill gammastep
  else
    gammastep -O 4500 &
  fi
  ;;
"Toggle Keyboard Layout")
  hyprctl switchxkblayout at-translated-set-2-keyboard next
  ;;
"Toggle Network")
  rfkill toggle wlan
  ;;
*)
  exit 1
  ;;
esac
