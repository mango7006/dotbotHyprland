#!/usr/bin/env bash

#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/hypr/hyprinputTEMP.conf"
LINE="kb_variant = intl"

if grep -qE "^\s*#\s*$LINE" "$CONFIG_FILE"; then
  echo "us"
elif grep -qE "^\s*$LINE" "$CONFIG_FILE"; then
  echo "intl"
else
  echo "Unknown Error"
fi
