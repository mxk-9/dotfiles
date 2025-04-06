#! /usr/bin/env sh

touchpad_id=$(xinput list | grep -i touchpad | cut -d '=' -f 2 | cut -d '[' -f 1)
touchpad_status=$(xinput list-props $touchpad_id | grep 'Device Enabled' | cut -d ':' -f 2)
touchpad_status=$(((1+ $touchpad_status) % 2))

xinput set-prop $touchpad_id 'Device Enabled' $touchpad_status
