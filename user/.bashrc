#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1
LOCATION="\W"
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
export PATH="~/.local/bin:/bin"

# aliases
alias mkdir="mkdir -p"
alias ls="ls --color=auto"
alias ga="git add .; git commit -m"
alias gp="git push"
alias vi="nvim"
alias dockc="docker-compose up --build"
alias dockd="docker-compose -f docker-compose.debug.yml up --build"

# functions
function vis() {
    touch $1
    chmod 755 $1
    echo -e "#!/bin/bash\n" > $1
    vi $1
}

function startpy() {
    mkdir -p $1
    cd $1
    touch requirements.txt
    echo "flake8" >> requirements.txt
    echo "black" >> requirements.txt
    echo "pytest" >> requirements.txt

    python3.10 -m venv env
    source env/bin/activate
    pip install -r requirements.txt
    deactivate

    cd ..
    code $1
}

