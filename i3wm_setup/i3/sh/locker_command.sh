#! /usr/bin/env sh

font="JetBrains Mono"
i3lock \
    --color=000000 \
    --radius 300 \
    --ring-width=15 \
    --keylayout 0 \
    --time-color=ffffffff \
    --time-font="$font" \
    --time-size=48 \
    --date-color=ffffffff \
    --date-font="$font" \
    --date-size=30 \
    --layout-color=ffffffff \
    --layout-font="$font" \
    --layout-size=24 \
    --greeter-color=ffffffff \
    --greeter-font="$font" \
    --wrong-font="$font" \
    --verif-font="$font" \
    --greeter-size=34 \
    --wrong-size=34 \
    --verif-size=34 \
    $1
