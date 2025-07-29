#!/usr/bin/env bash

source "$HOME/.config/scripts/options.conf"

kitty --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle

kitty --class terminalfloatsmall -e ssh "$homeserver" 'wake'

moonlight

## Packages directly used in this script:
# moonlight-qt (desktop streaming application)
# kitty (terminal emulator)
# openssh (ssh utility)
# wakeonlan (send magic packet to boot a specified device (this is only on my server you cannot do this) )
