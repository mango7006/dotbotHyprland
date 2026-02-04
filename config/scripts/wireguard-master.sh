#!/usr/bin/env bash

source "$HOME/options.conf"

uptime=$(($(cut -d. -f1 /proc/uptime) / 60))

check() {
  if wg show interfaces &>/dev/null; then
    wg show interfaces
  else
    echo "inactive"
  fi
}

toggle() {
  local input_interface="$1"

  if ip link show "$input_interface" | grep -q "UP"; then
    echo "Tearing down $input_interface..."
    sudo wg-quick down "$input_interface"
    return
  fi

  # Tear down other active WireGuard interfaces
  for active in $(wg show interfaces); do
    [[ $active != "$input_interface" ]] && {
      echo "Tearing down $active before bringing up $input_interface..."
      sudo wg-quick down "$active"
    }
  done

  # Home WiFi check (only for primary interface)
  if [[ $input_interface == "$home_vpn" ]]; then
    current_wifi=$(nmcli -t -f active,ssid dev wifi | awk -F: '/^yes/ {print $2}')
    if [[ "$current_wifi" == "$homewifi" || "$current_wifi" == "$homewifi2" ]]; then
      msg="You are home, not needed"
      echo "$msg..."
      ((uptime > 1)) && sleep 1
      return
    fi
  fi

  echo "Bringing up $input_interface..."
  sudo wg-quick up "$input_interface"
}

case "$1" in
toggle) toggle "$2" ;;
check) check ;;
*)
  echo "Usage: $0 {toggle|check} <interface>" >&2
  exit 1
  ;;
esac
