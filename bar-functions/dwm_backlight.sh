#!/bin/sh

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

dwm_backlight () {
    MAXBACKLIGHT=$(cat /sys/class/backlight/acpi_video0/max_brightness)
    CURRBACKLIGHT=$(cat /sys/class/backlight/acpi_video0/actual_brightness)
    printf "%s" "$SEP1"
    printf "☀ %s/%s" "$CURRBACKLIGHT" "$MAXBACKLIGHT"
    printf "%s\n" "$SEP2"
}

dwm_backlight
