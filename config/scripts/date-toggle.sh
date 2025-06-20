#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_date_toggle_state"

# Make state file
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
if [ "$STATE" == "long" ]; then
  date +"%d/%m" # e.g. 13/08
else
  date +"%d/%h" # e.g. 13/Aug
fi
