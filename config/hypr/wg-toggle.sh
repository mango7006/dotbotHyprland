#!/usr/bin/env bash

# Just pick n choose what interface you need to tunnel
INTERFACE="wg0"

# Check if the interface is up
if ip link show "$INTERFACE" | grep -q "UP"; then
  echo "Tearing down $INTERFACE..."
  sudo wg-quick down "$INTERFACE"
else
  echo "Bringing up $INTERFACE..."
  sudo wg-quick up "$INTERFACE"
fi
