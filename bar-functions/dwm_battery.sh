#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    TIME_NOW=$(date +"%s")

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" != "Discharging" ]; then
            printf "🗲 %s%% %s" "$CHARGE" "$STATUS"
        else
            batSymbol=""
            if [ "$CHARGE" -gt 90 ]; then
                batSymbol="█"
            elif [ "$CHARGE" -gt 60 ]; then
                batSymbol="▆"
            elif [ "$CHARGE" -gt 40 ]; then
                batSymbol="▅"
            elif [ "$CHARGE" -gt 20 ]; then
                batSymbol="▃"
            elif [ "$CHARGE" -gt 10 ]; then
                batSymbol="▁"
            else
            # show blinking bat symbol if battery is less than 10%
                if [ $((TIME_NOW % 2)) -eq 0 ]; then
                    batSymbol="!!!!!!!"
                else
                    batSymbol=" "
                fi
            fi
            printf "$batSymbol %s%% %s" "$CHARGE" "$STATUS"
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

