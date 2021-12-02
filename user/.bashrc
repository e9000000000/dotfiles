#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1
LOCATION="\w"
COLOR_DEFAULT="\[\033[00;39m\]"
if (( $EUID >= 1000 )); then
    COLOR="\[\033[00;32m\]"
else
    COLOR="\[\033[00;31m\]"
fi
export PS1="$COLOR${LOCATION/$HOME/'~'}$COLOR_DEFAULT "

# completions
complete -cf sudo
complete -cf doas
complete -cf which

# variables
. ~/some/vars
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="$HOME/.local/bin:/bin"

# aliases
alias mkdir="mkdir -p"
alias ls="ls --color=auto"
alias vi="nvim"


# functions____________________________________________________________________

# clear and run command if files matching pattern changed
# Example:
# autorun "src/*" make build_and_run
function autorun() {
    declare -a old_hashes=()
    
    while true; do
        declare -a new_hashes=()
        for file in $(find . 2>/dev/null -type f -name "$1"); do
            new_hashes+=$(sha256sum $file)
        done

        if [ "${old_hashes[*]}" != "${new_hashes[*]}" ]; then
            old_hashes=("${new_hashes[@]}")
            clear
            ${@:2}
        fi
        sleep 1
    done
}

# auto python venv activate. works if venv folder name in (env, .env)
function cd() {
    builtin cd $@
    if [ -d env ]; then
        . env/bin/activate
    elif [ -d .env ]; then
        . .env/bin/activate
    else
        if command -v deactivate > /dev/null; then
            deactivate
        fi
    fi
}
cd .
