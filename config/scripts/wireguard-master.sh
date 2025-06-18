#!/usr/bin/env bash

INTERFACE="wg0"

check() {
  if ip link show "$INTERFACE" up >/dev/null 2>&1; then
    echo "act"
  else
    exit 0
  fi
}

toggle() {
  if ip link show "$INTERFACE" | grep -q "UP"; then
    echo "Tearing down $INTERFACE..."
    sudo wg-quick down "$INTERFACE"
  else
    echo "Bringing up $INTERFACE..."
    sudo wg-quick up "$INTERFACE"
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
