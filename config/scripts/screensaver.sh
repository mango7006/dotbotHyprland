#!/usr/bin/env bash

current_brightness=$(brightnessctl g)

brightnessctl s 0

read -r -p "Black screen"

brightnessctl s "$current_brightness"
