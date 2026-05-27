#!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep tun1 | awk '{print $1}' | tr -d ':')

if [ "$IFACE" = "tun0" ]; then
	echo "%{F#1bb7bf} %{F#ffffff}$(/usr/sbin/ifconfig tun1 | grep "inet " | awk '{print $2}')%{u-}"
else
	echo "%{F#ff0055} Disconnected %{u-}"
fi
