#!/usr/bin/env bash

WG_INTERFACE="wg0"

if ip link show "$WG_INTERFACE" up >/dev/null 2>&1; then
  echo "/ wg on"
else
  exit 0
fi
