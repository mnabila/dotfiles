#!/bin/sh

# File              : interfaces.sh
# License           : MIT License
# Author            : Albawid
# Date              : Tuesday, 14/07/2020 19:19 WIB
# Last Modified Date: Tuesday, 14/07/2020 19:19 WIB
# Last Modified By  : Albawid
# Dependency        : connman

iface_name=$(ip route | grep '^default' | awk '{print $5}' | head -n 1)
service=$(connmanctl services | grep -E "^\*AO|^\*O" | grep -Eo 'wifi_.*|ethernet_.*')

if [ ! "$service" ]; then
    printf "No Internet"
    printf "%s\n" "$SEP2"
    return
else
    signal=$(connmanctl services "$service" | sed -n -e 's/Strength =//p' | tr -d ' ')
    con_name=$(connmanctl services "$service" | sed -n -e 's/Name =//p' | tr -d ' ')
fi

if [ "$iface_name" = "wlo1" ]; then
    printf "  %s" "$con_name"
  elif [ "$iface_name" = "enp0s25" ]; then
    printf "  Ethernet"
  elif [ "$iface_name" = "usb0" ]; then
    printf "   USB Tethering"
fi

printf "%s\n" "$SEP2"
