#!/bin/sh

# A dwm_bar function that shows the current artist, track, duration, and status from Spotify using playerctl
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: spotify, playerctl

# TODO: Find a method to get track position data and shuffle status (currently playerctl does not work for this)

dwm_spotify () {
    if ps -C spotify > /dev/null; then
        ARTIST=$(playerctl -p spotify metadata artist | head -c 15)
        TRACK=$(playerctl -p spotify metadata title | head -c 15)
        STATUS=$(playerctl -p spotify status)

        if [ "$IDENTIFIER" = "unicode" ]; then
            if [ "$STATUS" = "Playing" ]; then
                STATUS="▶"
            else
                STATUS="⏸"
            fi
        else
            if [ "$STATUS" = "Playing" ]; then
                STATUS="PLA"
            else
                STATUS="PAU"
            fi
        fi

        printf "%s%s %s-%s " "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
        printf "%s\n" "$SEP2"
    fi
}

dwm_spotify
