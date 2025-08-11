#!/usr/bin/env bash

source "$HOME/options.conf"

if ip link show "$interface" &>/dev/null; then
  echo "act"
else
  # echo "inactive"
  exit 1
fi
