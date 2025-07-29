#!/usr/bin/env bash

source "$HOME/.config/scripts/options.conf"

# Ensure the directory exists
mkdir -p "$save_dir"

timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

check() {
  if pgrep -x wf-recorder &>/dev/null || pgrep -x obs &>/dev/null; then
    echo "󰻃 "
  else
    exit 0
  fi
}

toggle() {
  if pgrep wf-recorder &>/dev/null; then
    pkill wf-recorder
  else
    # Create filename with timestamp
    file="$save_dir/screenrecord-$(date +"%Y%m%d-%H%M%S").mkv"
    # Start wf-recorder in background
    wf-recorder -f "$file" &
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

## Packages directly used in this script:
# wf-recorder (wayland screenrecord util)
# obs-studio (recording and streaming app)
