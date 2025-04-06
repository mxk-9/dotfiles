#! /usr/bin/env sh

item=$(echo "balanced
power saver" | rofi -dmenu)

case $item in
    "balanced") powerprofilesctl set balanced ;;
    "power saver") powerprofilesctl set power-saver ;;
esac
