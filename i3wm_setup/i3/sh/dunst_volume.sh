#! /usr/bin/env sh

function get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | head -1 | cut -d '/' -f 2 | cut -d '%' -f 1
}

function is_mute() {
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d ':' -f 2)

    if [ $mute == "yes" ]; then
        return true
    else
        return false
    fi
}

function send_notification {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -t 800 -r 2593 -u normal "    $bar"
}

case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        send_notification
        ;;

    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        send_notification
        ;;

    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        if is_mute; then
            dunstify -i audio-volume-muted -t 8 -r 2593 -u normal "Mute"
        else
            send_notification
        fi
        ;;
esac
