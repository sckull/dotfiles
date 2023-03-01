#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

#pkill -F /tmp/polybar-music.pid
#rm /tmp/polybar-music.pid

polybar first 2>~/.config/polybar/first.log &
polybar second 2>~/.config/polybar/second.log &
polybar fourth 2>~/.config/polybar/fourth.log &

