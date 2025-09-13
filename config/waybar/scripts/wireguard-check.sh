#!/usr/bin/env bash

# Check if WireGuard is active and not empty
if [ -n "$(wg show interfaces)" ]; then
  STATUS="$(wg show interfaces)"
  # Json format
  echo "{\"text\":\"$STATUS\"}"
else
  # Json format
  echo "{\"text\":\"inactive\"}"
fi
