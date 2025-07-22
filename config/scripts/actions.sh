#!/usr/bin/env bash

# Define menu options (what the user sees)
options="Toggle Recording\nToggle Bluetooth\nToggle Focus Mode\nToggle Wireguard\nToggle Light Filter\nToggle Keyboard Layout"

# Show wofi menu and get the selected option
choice=$(echo -e "$options" | wofi --dmenu --prompt "Select Action")

# Run the corresponding command
case "$choice" in
"Toggle Recording")
  ~/.config/scripts/recoder.sh toggle
  ;;
"Toggle Bluetooth")
  bluetooth toggle
  ;;
"Toggle Focus Mode")
  ~/.config/scripts/game-mode.sh
  ;;
"Toggle Wireguard")
  kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle
  ;;
"Toggle Light Filter")
  ~/.config/scripts/gammastep.sh
  ;;
"Toggle Keyboard Layout")
  hyprctl switchxkblayout at-translated-set-2-keyboard next
  ;;
*)
  exit 1
  ;;
esac
