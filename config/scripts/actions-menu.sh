#!/usr/bin/env bash

# Define menu options
options=$(
  cat <<EOF
Toggle Recording
Toggle Bluetooth
Toggle Focus Mode
Toggle Wireguard
Toggle Light Filter
Clean Temporary Files
EOF
)

## Extra options
# Toggle Playerctl
# Toggle Keyboard Layout
# Toggle Network

# Show wofi menu
# 41 pixels per option entry, i.e. 41 * 7 = 287
choice=$(echo -e "$options" | wofi -H 246 --dmenu --prompt "Select Action")

# Run the corresponding command
# These should not be commented, only in the options variable
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
"Clean Temporary Files")
  kitty --class terminalfloatsmall -e ~/.config/scripts/cleantmp.sh
  ;;
"Toggle Playerctl")
  playerctl play-pause
  ;;
*)
  exit 1
  ;;
esac
