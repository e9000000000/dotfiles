#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ls colors
alias ls='ls --color=auto'

# PS1
LOCATION="\W"
COLOR_DEFAULT="\[\033[00;39m\]"
if (( $EUID >= 1000 )); then
    COLOR="\[\033[00;32m\]"
else
    COLOR="\[\033[00;31m\]"
fi
export PS1="$COLOR${LOCATION/$HOME/'~'}$COLOR_DEFAULT "

# variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="/bin:/home/e/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin"
