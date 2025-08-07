#!/usr/bin/env bash

# Define menu options
options=$(
  cat <<EOF
Wake PC and Login
Toggle Light Filter
Toggle Wireguard
Calculator
Reload Waybar
Update Everything
Clean Temporary Files
EOF
)

## Extra options
# Toggle Bluetooth
# Clean Clipboard History
# Toggle Keyboard Layout
# Toggle Network

# 41 pixels per option entry, i.e. 41 * 7 = 287
pixels=$(($(echo "$options" | wc -l) * 41))

# Show wofi menu
choice=$(echo -e "$options" | wofi -H $pixels --sort-order=default --cache-file=/dev/null -d --prompt "Select Action")

# Run the corresponding command
# These should not be commented, only in the options variable
case "$choice" in
"Toggle Bluetooth")
  bluetooth toggle
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
"Clean Temporary Files")
  kitty --class terminalfloatsmall -e ~/.config/scripts/cleantmp.sh
  ;;
"Wake PC and Login")
  ~/.config/scripts/wake-pc.sh
  ;;
"Update Everything")
  kitty --class terminalfloat -e topgrade
  ;;
"Clean Clipboard History")
  clipse -clear
  ;;
"Reload Waybar")
  pkill waybar
  waybar &
  ;;
"Calculator")
  kitty --class terminalfloat -e calc
  ;;
*)
  exit 1
  ;;
esac

## Packages directly used in this script:
# kitty (terminal emulator)
# clipse (AUR clipboard manager)
# hyprctl (command line manager for Hyprland)
# gammastep (screen color shifting)
# bluetooth (bluez and bluez-utils packages)
# wofi (dmenu picker)
# topgrade-bin (AUR everything updater)
# waybar (wayland status bar)
