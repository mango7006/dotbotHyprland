#!/usr/bin/env bash

source "$HOME/.config/scripts/options.conf"

WifiName=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

uptime=$(awk '{print int($1 / 60)}' /proc/uptime)

check() {
  if ip link show "$interface" &>/dev/null; then
    echo "act"
  else
    exit 1
  fi
}

toggle() {
  if ip link show "$interface" | grep -q "UP"; then
    echo "Tearing down $interface..."
    sudo wg-quick down "$interface"
  else
    if [[ "$WifiName" == "$homewifi" ]]; then
      echo " "
      if [ "$uptime" -gt 2 ]; then
        read -r -p "You are home, not needed..."
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
