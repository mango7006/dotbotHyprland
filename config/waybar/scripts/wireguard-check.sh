#!/usr/bin/env bash

# Check if WireGuard is active and not empty
if [ -n "$(wg show interfaces)" ]; then
  STATUS="$(wg show interfaces)"
  PUBLIC_IP=$(curl -4 -s --max-time 2 https://api.ipify.org || echo "timeout")
  # Json format
  echo "{\"text\":\"$STATUS\",\"tooltip\":\"IP: $PUBLIC_IP\",\"alt\":\"$PUBLIC_IP\"}"
else
  PUBLIC_IP=$(curl -4 -s --max-time 2 ifconfig.me)
  # Json format
  echo "{\"text\":\"inactive\",\"tooltip\":\"IP: $PUBLIC_IP\",\"alt\":\"$PUBLIC_IP\"}"
fi
