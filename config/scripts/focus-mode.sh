#!/usr/bin/env bash

source "$HOME/.config/scripts/options.conf"

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ]; then
  hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 4;\
        keyword decoration:rounding 0"
  swww img "$focuswallpaper" --transition-type none
  exit
fi
hyprctl reload
swww img "$wallpaper" --transition-type none

## Packages directly used in this script:
# hyprland (hyprctl command line util)
# swww (wallpaper manager)
