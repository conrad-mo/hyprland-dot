#!/bin/bash

MPV_SOCKET_PATH="/tmp/mpv-socket"

mpvpaper -o "input-ipc-server=$MPV_SOCKET_PATH no-audio --loop" '*' ~/Videos/nightstudyroom4k.mp4 &

while pidof mpvpaper >/dev/null; do
	bat_state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')
	
	if [ "$bat_state" = "fully-charged" ] || [ "$bat_state" = "charging" ]; then
		echo 'set pause no' | socat - $MPV_SOCKET_PATH
	elif [ "$bat_state" = "discharging" ]; then
		echo 'set pause yes' | socat - $MPV_SOCKET_PATH
	fi
	
	sleep 5
done
