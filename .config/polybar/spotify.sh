#!/bin/bash

script=$0
cmd=$1
length=${2:-20}
padding=${3:-" - "}

player="spotify"

case $cmd in
	scroll)
		# Start scrolling
		zscroll -U 1 -l $length -p "$padding" -u true "$script update" &
		wait
		echo ""
		;;
	update)
		# Notify polybar about updates
		title=$(playerctl -p $player metadata title 2>/dev/null)
		artist=$(playerctl -p $player metadata artist 2>/dev/null)
		state=$(playerctl -p $player status 2>/dev/null)

		case $state in
			"Playing")
				polybar-msg hook spotify-play-pause 3 > /dev/null 2>&1
				polybar-msg hook spotify-next 2 > /dev/null 2>&1
				polybar-msg hook spotify-prev 2 > /dev/null 2>&1
				;;
			"Paused")
				polybar-msg hook spotify-play-pause 2 > /dev/null 2>&1
				polybar-msg hook spotify-next 2 > /dev/null 2>&1
				polybar-msg hook spotify-prev 2 > /dev/null 2>&1
				;;
			"Stopped")
				polybar-msg hook spotify-play-pause 2 > /dev/null 2>&1
				polybar-msg hook spotify-next 2 > /dev/null 2>&1
				polybar-msg hook spotify-prev 2 > /dev/null 2>&1
				;;
			*)
				polybar-msg hook spotify-play-pause 1 > /dev/null 2>&1
				polybar-msg hook spotify-next 1 > /dev/null 2>&1
				polybar-msg hook spotify-prev 1 > /dev/null 2>&1
				;;
		esac

		if [ -n "$state" ]; then
			echo "$artist - $title"
		else
			echo ""
		fi
		;;
	*)
		echo "Unkown command"
		exit 1
		;;
esac