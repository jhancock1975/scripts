#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.
# get the input number with the "xinput list" command
TOGGLE=$HOME/.toggle_touchpad

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xinput disable 11
    notify-send -u low -i mouse --icon=/usr/share/icons/HighContrast/256x256/status/touchpad-disabled.png "Trackpad disabled"
else
    rm $TOGGLE
    xinput enable 11
    notify-send -u low -i mouse --icon=/usr/share/icons/HighContrast/256x256/devices/input-touchpad.png "Trackpad enabled"
fi
