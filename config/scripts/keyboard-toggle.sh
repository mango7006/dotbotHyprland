#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/hypr/hyprinputTEMP.conf"
LINE="kb_variant = intl"

# Toggle the line: comment it if active, uncomment it if commented
if grep -qE "^\s*#\s*$LINE" "$CONFIG_FILE"; then
  # Line is commented — uncomment it
  sed -i "s|^\(\s*\)#\s*\($LINE\)|\1\2|" "$CONFIG_FILE"
elif grep -qE "^\s*$LINE" "$CONFIG_FILE"; then
  # Line is uncommented — comment it
  sed -i "s|^\(\s*\)\($LINE\)|\1# \2|" "$CONFIG_FILE"
else
  echo "Unknown Error"
fi
