#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w\$(parse_git_branch) \$ "

# completions
complete -cf sudo
complete -cf doas
complete -cf which
complete -cf time

# env vars
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/usr/sbin"

# aliases
alias vi=nvim
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias rbt="systemctl reboot"
. "$HOME/.cargo/env"
