#!/usr/bin/env bash

source "$HOME/options.conf"

toggle() {
  if ip link show "$interface" | grep -q "UP"; then
    :
  else
    kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle RPI-Home
  fi
}

# Change this to the bottom one if you do not have ssh keys
ssh "$rpi" 'wake'
# kitty --class terminalfloatsmall -e ssh "$rpi" 'wake'

moonlight

## Packages directly used in this script:
# moonlight-qt (desktop streaming application)
# kitty (terminal emulator)
# openssh (ssh utility)
# wakeonlan (send magic packet to boot a specified device (this is only on my server you cannot do this unless setup) )
# wofi (dmenu picker)
