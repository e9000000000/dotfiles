#!/bin/bash

if pgrep -x "trayer" > /dev/null
then
    pkill trayer
else
    ~/.scripts/trayer
fi
