#!/bin/bash

DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
while [ 1 ]
do
    feh --bg-center `python3 $DIR/anime_bg.py`;
    if [ $1 ]
    then
	sleep $1;
    else
	sleep 30;
    fi
done
