#!/bin/bash
vpn=$(ip addr show dev $1 | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' | cut -d $'\n' -f1| awk '{print $1}')
echo -n $vpn | xclip -sel clip

if [ -z "$vpn" ]
then      
      notify-send -u normal "interface '$1' empty"
else
      notify-send -u normal "$2 $vpn copied."
fi