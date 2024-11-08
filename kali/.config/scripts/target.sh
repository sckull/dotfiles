#!/bin/sh

ip_target=$(cat ~/.config/scripts/target | awk '{print $1}')
name_target=$(cat ~/.config/scripts/target | awk '{print $2}')

	if [ $ip_target ] && [ $name_target ]; then
	echo "%{F#7dcfff}什%{F#ffffff} $ip_target - $name_target"
	elif [ $(cat ~/.config/scripts/target | wc -w) -eq 1 ]; then
	echo "%{F#7dcfff}什%{F#ffffff} $ip_target"
	else
	echo "%{F#ff0055}ﲅ %{u-}%{F#ffffff} No target"
	fi

