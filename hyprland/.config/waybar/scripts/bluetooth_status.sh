#!/bin/bash

ICON_CONNECTED="󰂱"
ICON_DISCONNECTED="󰂲"
DEVICE_MAC="3C:B0:ED:37:C6:58"
DEVICE_PATH="/org/freedesktop/UPower/devices/headset_dev_3C_B0_ED_37_C6_58"

# Check if Bluetooth is powered on
BT_POWERED=$(bluetoothctl show | grep "Powered: yes")

# Check if the specific device is connected
IS_CONNECTED=$(bluetoothctl info "$DEVICE_MAC" | grep "Connected: yes")

# Get battery percentage
BATTERY=$(upower -i "$DEVICE_PATH" | awk '/percentage:/ {print $2}')

if [[ -n "$BT_POWERED" ]]; then
    if [[ -n "$IS_CONNECTED" ]]; then
        echo "{\"text\": \"$ICON_CONNECTED $BATTERY\", \"tooltip\": \"Connected to headset\nBattery: $BATTERY\"}"
    else
        echo "{\"text\": \"$ICON_DISCONNECTED\", \"tooltip\": \"Bluetooth on, no device connected\"}"
    fi
else
    echo "{\"text\": \"$ICON_DISCONNECTED\", \"tooltip\": \"Bluetooth is off\"}"
fi

