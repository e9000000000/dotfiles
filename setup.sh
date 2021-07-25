#!/bin/bash

# dir that script locate in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install paru
bash $DIR/scripts/paru_install.sh

# update software
paru -Syu

# install all another software with paru
for NAME in $(cat $DIR/lists/to_install)
do
    paru -S --noconfirm $NAME
done

# enable services
bash $DIR/scripts/services.sh

# install fish
# bash $DIR/scripts/install_fish.sh

# copy config files
cp -r $DIR/user/. ~

# configuring bash on system start
ln -s ~/.bashrc ~/.profile

# set up cron
bash $DIR/scripts/cron.sh

# python libs
pip install pynvim pyflakes flake8 rope black

# cron
crontab $DIR/user/.scripts/cron/user
doas crontab $DIR/user/.scripts/cron/root
