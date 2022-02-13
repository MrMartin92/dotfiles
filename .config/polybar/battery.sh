#!/bin/bash

battery_symbols=("󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")
charge_symbols=("󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅")

batteries="/sys/class/power_supply/BAT?"

# Calculate capacity in percent over all batteries and check for charging
symbols=(${battery_symbols[@]})
for bat in $batteries; do
	capacity=$(($capacity + $(cat $bat/capacity)))
	if [[ $(cat $bat/status) == "Charging" ]]; then
		symbols=(${charge_symbols[@]})
	fi
done
capacity=$(($capacity / (${#batteries[@]} + 1)))


# Get symbol
# symbol_index=$(($capacity * (${#symbols[@]} - 1) / 100))
symbol_index=$(($capacity / (100 / (${#symbols[@]} - 1))))
symbol=${symbols[$symbol_index]}

echo $symbol $capacity%