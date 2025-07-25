#!/usr/bin/env bash

paccache -rk1
sudo systemd-tmpfiles --clean
paru -Sc --noconfirm
sudo journalctl --vacuum-time=7d
rm -rf ~/.cache/paru/clone/
