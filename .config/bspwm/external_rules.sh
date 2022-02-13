#!/bin/sh

wid=$1
class=$2
instance=$3
consequences=$4

# notify-send "$wid|||$class|||$instance|||$consequences"

main() {
	case "$class.$instance" in
		Spotify.*)
			echo "desktop=music"
			;;
		Code.*)
			echo "desktop=code"
			;;
		firefox.Toolkit) # Firefox Picture-In-Picture
			echo "state=floating sticky"
			;;
		"")
			sleep 0.5

			wm_class=($(xprop -id $wid | grep "WM_CLASS" | grep -Po '"\K[^,"]+'))

			class=${wm_class[-1]}

			[[ ${#wm_class[@]} == "2" ]] && instance=${wm_class[0]}

			[[ -n "$class" ]] && main
			;;
	esac
}

main