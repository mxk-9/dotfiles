#! /usr/bin/env sh

fileType=png
fileName=$(date +%Y-%m-%d_%H-%M-%S).$fileType
pathToDir=$HOME/Pictures/TemporaryScreen
screenCreated=false

if ! [[ -d $pathToDir ]]; then
    mkdir -p $pathToDir
fi

case $1 in
    "area")
        maim -s $pathToDir/$fileName
        ;;

    "window")
        maim -i $(xdotool getactivewindow) $pathToDir/$fileName
        ;;

    "full")
        maim $pathToDir/$fileName
        ;;
esac

ls $pathToDir/$fileName 2> /dev/null
if [ $? -eq 0 ]; then
    screenCreated=true
    cat $pathToDir/$fileName | xclip -sel clip -t image/png
fi

if $sceenCreated; then
    dunstify -u normal -t 500 "Screenshot saved"
fi
