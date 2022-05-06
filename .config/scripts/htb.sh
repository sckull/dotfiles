#!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep tun1 | awk '{print $1}' | tr -d ':')

if [ "$IFACE" = "tun1" ]; then
	echo "%{F#1bbf3e} %{F#ffffff}$(/usr/sbin/ifconfig tun1 | grep "inet " | awk '{print $2}')%{u-}"
else
	echo "%{F#1bbf3e}%{u-}"
fi