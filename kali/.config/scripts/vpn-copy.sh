#!/bin/bash
vpn=$(ip addr show dev $1 | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' | cut -d $'\n' -f1| awk '{print $1}')
echo -n $vpn | xclip -sel clip
notify-send -t 3000 -u normal "$vpn ($2) copiada" -i $HOME/.config/icons/online.svg