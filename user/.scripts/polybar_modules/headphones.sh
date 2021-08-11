#!/bin/bash

SINK_INDEX=$(pacmd list-sinks | grep "\* index:" | cut -d' ' -f5)
is_muted=$(pacmd list-sinks | grep "index: $SINK_INDEX" -A 11 | grep "muted" | grep "yes|no" -oE)

if [ $is_muted = "yes" ] ; then
    echo 'headphones'
else
    echo ''
fi

