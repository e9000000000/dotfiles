#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
export PS1="\w \$ "

# completions
complete -cf sudo
complete -cf doas
complete -cf which
complete -cf time

# env vars
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="/usr/local/bin:/usr/bin:/usr/sbin"

# aliases
alias ls="ls --color=auto"
alias vi="nvim"
