#! /usr/bin/env sh
case $1 in
    "off")
        nmcli networking off
        rfkill block wlan
        ;;

    "on")
        rfkill unblock wlan
        nmcli networking on
        ;;
esac
