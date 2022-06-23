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

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# variables
if [ -f ~/some/vars ]; then
    . ~/some/vars
fi
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="$HOME/.local/bin:/bin"

# aliases
alias mkdir="mkdir -p"
alias ls="ls --color=auto"
alias duh="du -h -BM -a --max-depth=1 2>/dev/null | sort -n"
alias vi="nvim"
alias n="nnn"
alias pvi="poetry run nvim"
alias lg="lazygit"


# functions____________________________________________________________________

# clear and run command if files matching pattern changed
# Example:
#     autorun "src/*" make build_and_run
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
