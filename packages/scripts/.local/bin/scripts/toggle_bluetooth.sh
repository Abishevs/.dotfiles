#!/bin/bash

status=$(rfkill list bluetooth | grep "Soft blocked: yes")

if [ -z "$status" ]; then
    rfkill block bluetooth
    notify-send -i bluetooth-disabled "Bluetooth turned off"
else
    rfkill unblock bluetooth
    notify-send -i bluetooth-active "Bluetooth turned on"
fi
