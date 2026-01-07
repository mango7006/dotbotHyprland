#!/usr/bin/env bash

# Check if WireGuard is active and not empty
if [ -n "$(wg show interfaces)" ]; then
  STATUS="$(wg show interfaces)"
  echo "$STATUS"
else
  exit 0
fi
