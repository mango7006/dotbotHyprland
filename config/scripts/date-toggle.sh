#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_date_toggle_state"

# Make state file
if [ ! -f "$STATE_FILE" ]; then
  echo "short" >"$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$1" == "toggle" ]; then
  case "$STATE" in
  short) echo "long" >"$STATE_FILE" ;;
  long) echo "day" >"$STATE_FILE" ;;
  day | *) echo "short" >"$STATE_FILE" ;;
  esac
  exit 0
fi

case "$STATE" in
short) date +"%d/%m" ;;      # e.g. 13/08
long) date +"%d/%b" ;;       # e.g. 13/Aug
day | *) date +"%a %d/%b" ;; # e.g. Sat 13/Aug
esac
