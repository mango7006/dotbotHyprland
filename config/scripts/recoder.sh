#!/usr/bin/env bash

# Directory to save recordings
SAVE_DIR="$HOME/Videos/screenrecord"

# Ensure the directory exists
mkdir -p "$SAVE_DIR"

timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

check() {
  if pgrep wf-recorder &>/dev/null; then
    echo "󰻃 "
  else
    exit 0
  fi
}

toggle() {
  if pgrep wf-recorder &>/dev/null; then
    pkill wf-recorder
    echo "$(timestamp) - Stopped wf-recorder"
  else
    # Create filename with timestamp
    FILE="$SAVE_DIR/screenrecord-$(date +"%Y%m%d-%H%M%S").mkv"
    echo "$(timestamp) - Starting wf-recorder, saving to $FILE"
    # Start wf-recorder in background
    wf-recorder -f "$FILE" &
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
