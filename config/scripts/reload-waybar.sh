#!/usr/bin/env bash

loop() {
  while true; do
    # Check the original sha1sum and the new one (maybe)
    original=$(sha256sum ~/.config/waybar/config.jsonc | awk '{print $1}')
    # echo "$original"
    sleep 5
    changedMaybe=$(sha256sum ~/.config/waybar/config.jsonc | awk '{print $1}')
    # echo "$changedMaybe"

    if [[ "$original" == "$changedMaybe" ]]; then
      # echo "It's the same! "
      :
    else
      pkill waybar
      sleep 0.1
      waybar &>/dev/null &
    fi
  done
}

reload() {
  pkill waybar
  waybar &
}

case "$1" in
loop) loop ;;
reload) reload ;;
*)
  echo "Usage: $0 {loop|reload}" >&2
  exit 1
  ;;
esac
