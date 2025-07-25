#!/usr/bin/env bash

source ~/.config/scripts/homewifi.conf

WGon=$(~/.config/scripts/wireguard-master.sh check)
WifiName=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

if [[ "$WGon" == "act" ]]; then
  # Do nothing
  :
else
  if [[ "$WifiName" == "$homewifi" ]]; then
    echo "True!!!"
  else
    # Only toggle WireGuard on if not on "Eendje" wifi, and it's not already active
    kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle
  fi
fi

ssh pipi4@192.168.11.128 'wakeonlan 2C:F0:5D:55:17:08'

moonlight
