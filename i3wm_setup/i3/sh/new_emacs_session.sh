#!/usr/bin/env sh

session_name=$(rofi -dmenu)
path=$(rofi -dmenu)

em_daemon="emacs --title=$session_name --daemon=$session_name --chdir=$path"
em_client="emacsclient -nc --socket=$session_name"

if [[ $session_name != "" ]] && [[ $path != "" ]]; then
    $(eval $em_daemon) && $(eval $em_client)
fi
