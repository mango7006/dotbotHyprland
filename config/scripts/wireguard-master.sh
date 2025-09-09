#!/usr/bin/env bash

source "$HOME/options.conf"

uptime=$(awk '{print int($1 / 60)}' /proc/uptime)

check() {
  if ip link show "$interface" &>/dev/null; then
    echo "active"
  else
    echo "inactive"
  fi
}

toggle() {
  current_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
  if ip link show "$interface" | grep -q "UP"; then
    echo "Tearing down $interface..."
    sudo wg-quick down "$interface"
  else
    if [[ "$current_wifi" == "$homewifi" ]]; then
      if [ "$uptime" -gt 1 ]; then
        echo "You are home, not needed..."
        sleep 1
      else
        echo "You are home, not needed"
      fi
    else
      echo "Bringing up $interface..."
      sudo wg-quick up "$interface"
    fi
  fi
}

case "$1" in
toggle) toggle ;;
check) check ;;
*)
  echo "Usage: $0 {toggle|check}" >&2
  exit 1
  ;;
esac

## Packages directly used in this script:
# wireguard-tools (wg-quick private tunnel to my home network)
# networkmanager (nmcli command line interface)
