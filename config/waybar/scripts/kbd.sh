#!/usr/bin/env bash

kbd_map=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap')
kbd_name=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .name')

check() {
  case "$kbd_map" in
  "English (US)")
    echo "us"
    ;;
  "Russian (phonetic)")
    echo "ru"
    ;;
  "English (US, intl., with dead keys)")
    echo "intl"
    ;;
  *)
    hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap'
    ;;
  esac
}

next() {
  hyprctl switchxkblayout "$kbd_name" next
}

case "$1" in
next) next ;;
check) check ;;
*)
  echo "Usage: $0 {next|check}" >&2
  exit 1
  ;;
esac

# This needs:
# jq
# hyprland (for hyprctl)
