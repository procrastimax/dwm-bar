#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    MEMUSED=$(free | awk '(NR == 2) {print $3}')
    MEMTOT=$(free | awk '(NR == 2) {print $2}')
    MEMPERC=$(( $((MEMUSED*100)) / MEMTOT))%

    CPUTEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    CPUTEMP=$(($CPUTEMP / 1000 ))
    CPUPERCENT=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    STOPER=$(df -h | grep '/$' | awk '{print $5}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "💻 RAM: %s /: %s CPU: %.f%% %s°C" "$MEMPERC" "$STOPER" "$CPUPERCENT"  "$CPUTEMP"
    else
        printf "RAM: %s /: %s CPU: %.f%% %s°C" "$MEMPERC" "$STOPER" "$CPUPERCENT"  "$CPUTEMP"
    fi
    printf "%s\n" "$SEP2"
}

dwm_resources
