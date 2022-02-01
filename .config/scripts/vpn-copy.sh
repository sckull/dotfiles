#!/bin/bash
vpn=$(ip addr show dev tun0 | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' | cut -d $'\n' -f1| awk '{print $1}')
echo -n $vpn | xclip -sel clip
notify-send -t 3000 -u normal "$vpn copiada" -i $HOME/.config/icons/online.svg