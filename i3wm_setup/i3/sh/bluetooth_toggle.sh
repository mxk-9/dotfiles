#! /usr/bin/env sh
get_blctl_state() {
    echo $(bluetoothctl show | grep Powered | cut -f 2 -d ':')
}

if [[ $(get_blctl_state) == "no" ]]; then
    rfkill unblock bluetooth
    bluetoothctl power on
else
    bluetoothctl power off
    rfkill block bluetooth
fi
