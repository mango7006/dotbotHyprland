#!/usr/bin/env bash

# This keyboard switcher is Hyprland only, disable or change module with other WM's

if hyprctl devices | grep -q "intl., with"; then
  echo "intl"
else
  echo "us"
fi
