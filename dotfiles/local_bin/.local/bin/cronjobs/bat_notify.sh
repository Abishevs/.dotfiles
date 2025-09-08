#!/bin/bash

# Battery threshold percentage
THRESHOLD=25

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Get the current battery percentage
BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
# Get the charging status
BATTERY_STATUS=$(acpi -b | grep -o 'Charging\|Discharging')
notif-send -i "${BATTERY_STATUS}"

# Check if the battery level is less than or equal to the threshold and if it is discharging
if [ "$BATTERY_LEVEL" -le "$THRESHOLD" ] && [ "$BATTERY_STATUS" == "Discharging" ]; then
    notify-send -i battery-caution "Battery Low" "Battery level is at ${BATTERY_LEVEL}%"
fi

