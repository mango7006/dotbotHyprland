#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/hypr/hyprinputTEMP.conf"
LINE="kb_variant = intl"

# Only comment the line if it's not already commented
startup() {
  sed -i "/^[[:space:]]*[^#][[:space:]]*$LINE/ s|^\([[:space:]]*\)|\1# |" "$CONFIG_FILE"
}

# Toggle the line: comment it if active, uncomment it if commented
toggle() {
  if grep -qE "^\s*#\s*$LINE" "$CONFIG_FILE"; then
    # Line is commented — uncomment it
    sed -i "s|^\(\s*\)#\s*\($LINE\)|\1\2|" "$CONFIG_FILE"
  elif grep -qE "^\s*$LINE" "$CONFIG_FILE"; then
    # Line is uncommented — comment it
    sed -i "s|^\(\s*\)\($LINE\)|\1# \2|" "$CONFIG_FILE"
  else
    echo "Unknown Error"
  fi
}

# Checks if the line is commented, only echo's status
check() {
  if grep -qE "^\s*#\s*$LINE" "$CONFIG_FILE"; then
    echo "us"
    return 0
  elif grep -qE "^\s*$LINE" "$CONFIG_FILE"; then
    echo "intl"
    return 0
  else
    echo "Resolving"
  fi
}

case "$1" in
startup) startup ;;
toggle) toggle ;;
check) check ;;
*)
  echo "Usage: $0 {startup|toggle|check}" >&2
  exit 1
  ;;
esac
