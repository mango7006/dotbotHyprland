#!/usr/bin/env bash

kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle

ssh pipi4@192.168.11.128 'wakeonlan 2C:F0:5D:55:17:08'

moonlight
