#! /usr/bin/env sh

item=$(echo "suspend
logout
poweroff
reboot" | rofi -dmenu)

case $item in
    "suspend") systemctl suspend;;
    "logout") i3-msg exit ;;
    "poweroff") poweroff ;;
    "reboot") reboot ;;
esac
