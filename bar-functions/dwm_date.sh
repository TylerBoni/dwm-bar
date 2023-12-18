#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        # printf "🕰 %s" "$(date "+%a %m-%d-%y %T")"

        # print date with 12 hour time
        printf "🕰 %s" "$(date "+%a %m-%d-%y %r")"
    else
        printf "DAT %s" "$(date "+%a %m-%d-%y %r")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
