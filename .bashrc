#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1
COLOR_DEFAULT="\[\033[00;39m\]"
if (( $EUID != 0 )); then
    COLOR="\[\033[00;32m\]"
else
    COLOR="\[\033[00;31m\]"
fi
export PS1="$COLOR\w$COLOR_DEFAULT "

# completions
complete -cf sudo
complete -cf doas
complete -cf which
complete -cf time

# variables
if [ -f ~/some/vars ]; then
    . ~/some/vars
fi
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vi"
export PATH="$HOME/.local/bin:/bin"

# aliases
alias ls="ls --color=auto"
