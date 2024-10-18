#!/bin/sh
if [ "$1" == "up" ]
then
	(pactl set-sink-volume "$(pactl info | grep 'Default Sink' | awk '{print $3}')" +2.5%)

elif [ "$1" == "down" ]
then
	(pactl set-sink-volume "$(pactl info | grep 'Default Sink' | awk '{print $3}')" -2.5%)

elif [ "$1" == "mute" ]
then
	(pactl set-sink-mute "$(pactl info | grep 'Default Sink' | awk '{print $3}')" 0)

elif [ "$1" == "unmute" ]
then
	(pactl set-sink-mute "$(pactl info | grep 'Default Sink' | awk '{print $3}')" 1)

elif [ "$1" == "toggle" ]
then (pactl set-sink-mute "$(pactl info | grep 'Default Sink' | awk '{print $3}')" toggle)

else
	echo "Usage: volume {up|down|mute|unmute|toggle}"
fi
