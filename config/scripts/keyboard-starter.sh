#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/hypr/hyprinputTEMP.conf"
LINE="kb_variant = intl"

# Only comment the line if it's not already commented
sed -i "/^[[:space:]]*[^#][[:space:]]*$LINE/ s|^\([[:space:]]*\)|\1# |" "$CONFIG_FILE"
