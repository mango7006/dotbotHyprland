#!/usr/bin/env bash

show_help_menu() {
    echo -e "How to use $0"
    echo -e "\n\t--help\t\t\tShow this help menu and exit"
    echo -e "\n\t-c <interface_name>\tScan QR code and creat new wireguard interface"
    echo -e "\n\t-s </path/to/file>\tCreat a QR code based on a given file"
}

create_wg_interface() {
    super_secret_interface=$(zbarcam --nodisplay --raw -1)
    echo "$super_secret_interface" | sudo tee -a "/etc/wireguard/$2.conf"
}

show_qr_code() {
    cat "$2" | qrencode -t ANSIUTF8
}

case "$1" in
-c) create_wg_interface "$2" ;;
-s) show_qr_code "$2" ;;
--help) show_help_menu ;;
*)
    show_help_menu
    exit 1
    ;;
esac
