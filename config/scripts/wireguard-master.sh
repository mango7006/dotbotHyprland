#!/usr/bin/env bash

source "$HOME/options.conf"

uptime=$(awk '{print int($1 / 60)}' /proc/uptime)

check() {
  if [ -n "$(wg show interfaces)" ]; then
    STATUS="$(wg show interfaces)"
    echo "$STATUS"
  else
    echo "inactive"
  fi
}

toggle() {
  local iface="$1"

  if ip link show "$iface" | grep -q "UP"; then
    echo "Tearing down $iface..."
    sudo wg-quick down "$iface"
  else
    # Check for already active WireGuard interfaces
    active_ifaces=$(wg show interfaces | tr ' ' '\n' | grep -v "^$")

    for active in $active_ifaces; do
      if [[ "$active" != "$iface" ]]; then
        echo "Tearing down $active before bringing up $iface..."
        sudo wg-quick down "$active"
      fi
    done

    if [[ "$iface" == "$interface" ]]; then
      # Only check WiFi if iface is RPI-Home
      current_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
      if [[ "$current_wifi" == "$homewifi" ]]; then
        if [ "$uptime" -gt 1 ]; then
          echo "You are home, not needed..."
          sleep 1
        else
          echo "You are home, not needed"
        fi
        return
      fi
    fi

    echo "Bringing up $iface..."
    sudo wg-quick up "$iface"
  fi
}

case "$1" in
toggle) toggle "$2" ;;
check) check "$2" ;;
*)
  echo "Usage: $0 {toggle|check} <interface>" >&2
  exit 1
  ;;
esac
