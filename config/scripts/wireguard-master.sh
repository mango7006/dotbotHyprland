#!/usr/bin/env bash

source ~/.config/scripts/options.conf

WifiName=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

check() {
  if ip link show "$INTERFACE" &>/dev/null; then
    echo "act"
  else
    exit 1
  fi
}

toggle() {
  if ip link show "$INTERFACE" | grep -q "UP"; then
    echo "Tearing down $INTERFACE..."
    sudo wg-quick down "$INTERFACE"
  else
    if [[ "$WifiName" == "$homewifi" ]]; then
      echo "You are home, not needed"
      read -r -p "..."
    else
      echo "Bringing up $INTERFACE..."
      sudo wg-quick up "$INTERFACE"
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
