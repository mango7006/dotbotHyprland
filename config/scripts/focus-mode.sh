#!/usr/bin/env bash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ]; then
  hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 4;\
        keyword decoration:rounding 0"
  swww img ~/.config/hypr/wallpapers/dark.png --transition-type none
  exit
fi
hyprctl reload
swww img ~/.config/hypr/wallpapers/tTIlCNT.jpeg --transition-type none
