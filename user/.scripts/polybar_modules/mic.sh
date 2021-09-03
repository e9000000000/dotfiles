#!/bin/bash

MIC_INDEX=$(pacmd list-sources | grep "\* index:" | cut -d' ' -f5)
is_muted=$(pacmd list-sources | grep "index: $MIC_INDEX" -A 11 | grep "muted" | grep "yes|no" -oE)

if [ $is_muted = "yes" ] ; then
    echo '🎙'
else
    echo ''
fi

