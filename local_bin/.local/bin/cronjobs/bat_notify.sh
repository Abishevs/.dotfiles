#!/bin/bash

# Battery threshold percentage
THRESHOLD=25

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Get the current battery percentage
BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Check if the battery level is less than or equal to the threshold
if [ "$BATTERY_LEVEL" -le "$THRESHOLD" ]; then
	notify-send -i battery-caution "Battery Low" "Battery level is at ${BATTERY_LEVEL}%"
fi

