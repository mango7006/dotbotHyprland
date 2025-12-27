#!/usr/bin/env bash

paccache -rk0
sudo systemd-tmpfiles --clean
paru -Sc --noconfirm
sudo journalctl --vacuum-time=7d
rm -rf ~/.cache/paru/clone/
rm -rf ~/.cache/yay/clone/

## Packages directly used in this script:
# pacman-contrib (paccache utility)
# paru (AUR package manager)
# sudo (permissions escalator)
