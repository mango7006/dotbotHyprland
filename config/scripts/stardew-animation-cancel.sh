#!/usr/bin/env bash

do_sequence() {
    ydotool mousedown 272
    sleep 0.01
    ydotool mouseup 272
    sleep 0.125
    ydotool key 0x15 0x4c 0x36
    sleep 0.01
    ydotool key --up 0x15 0x4c 0x36
    sleep 20
}

DEVICE="/dev/input/event18"

sudo evtest $DEVICE | while read line; do
    case "$line" in
    *BTN_Z*value\ 1*)
        echo "Trigger"
        do_sequence
        ;;
    esac
done
