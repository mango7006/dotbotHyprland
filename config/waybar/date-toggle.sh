#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_date_toggle_state"

# Set default state if not exists
if [ ! -f "$STATE_FILE" ]; then
  echo "short" >"$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$1" == "toggle" ]; then
  # Toggle state
  if [ "$STATE" == "short" ]; then
    echo "long" >"$STATE_FILE"
  else
    echo "short" >"$STATE_FILE"
  fi
  exit 0
fi

# Display according to current state
if [ "$STATE" == "short" ]; then
  date +"%d/%m"
else
  date +"%d/%B"
fi
