#!/bin/sh

case $1 in
    "period-changed")
        exec notify-send "Period changed" "From: $2\nTo: $3"
        ;;
esac
