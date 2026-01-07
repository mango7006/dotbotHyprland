#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with sudo or as root"
  exit 1
fi

systemctl enable --now sshd.service
ufw allow 2222
sleep 120

systemctl disable --now sshd.service
ufw deny 2222
