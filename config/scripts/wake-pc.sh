#!/usr/bin/env bash

WGon=$(~/.config/scripts/wireguard-master.sh check)

if [[ "$WGon" == "act" ]]; then
  echo "its on!"
else
  kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle
fi

ssh pipi4@192.168.11.128 'wakeonlan 2C:F0:5D:55:17:08'

moonlight
