#! /usr/bin/env sh

item=$(echo "mirror
to right
to left
external
internal
no vsync
vsync" | rofi -dmenu)

case $item in
    "mirror") xrandr --output HDMI1 --auto --same-as eDP1 ;;
    "to right") xrandr --output HDMI1 --auto --right-of eDP1 --output eDP1 --auto ;;
    "to left") xrandr --output HDMI1 --auto --left-of eDP1 --output eDP1 --auto ;;
    "external") xrandr --output HDMI1 --auto --output eDP1 --off ;;
    "internal") xrandr --output eDP1 --auto --output HDMI1 --off ;;
    "no vsync") pkill picom ;;
    "vsync") picom --vsync & ;;

esac

setup_wallpaper.sh
pkill warpd
wait $!
warpd

