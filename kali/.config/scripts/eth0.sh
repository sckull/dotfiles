#!/bin/bash
echo "%{F#7dcfff}囹 %{F#ffffff}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}') %{u-}"
