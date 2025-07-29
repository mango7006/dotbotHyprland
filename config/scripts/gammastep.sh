#!/usr/bin/env bash

if pgrep gammastep >/dev/null; then
  echo "Is already on"
  :
else
  gammastep -O 4500 &
fi
