#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
export PS1="\w ::: "

# completions
complete -cf sudo
complete -cf doas
complete -cf which
complete -cf time

# env vars
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PAGER="less -S"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/usr/sbin"

# aliases
alias vi=nvim
alias python=python3
alias pdb=pdb3
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
. "$HOME/.cargo/env"
