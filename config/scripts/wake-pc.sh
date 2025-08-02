#!/usr/bin/env bash

source "$HOME/options.conf"

kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle

choice=$(echo -e "Yes\nNo" | wofi -H 88 --sort-order=default --cache-file=/dev/null --dmenu --prompt "Wake your PC?")
if [[ "$choice" != "Yes" ]]; then
  exit 0
fi

kitty --class terminalfloatsmall -e ssh "$homeserver" 'wake'

moonlight

## Packages directly used in this script:
# moonlight-qt (desktop streaming application)
# kitty (terminal emulator)
# openssh (ssh utility)
# wakeonlan (send magic packet to boot a specified device (this is only on my server you cannot do this unless setup) )
# wofi (dmenu picker)
