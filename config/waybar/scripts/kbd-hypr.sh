#!/usr/bin/env bash

read -r kbd_name kbd_map < <(
  hyprctl -j devices | jq -r '
    .keyboards[] | select(.main) | "\(.name) \(.active_keymap)"'
)

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
