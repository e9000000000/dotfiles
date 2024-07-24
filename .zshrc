set -o emacs
autoload -U compinit; compinit
autoload -U select-word-style

select-word-style bash

alias ls="ls --color=auto"
alias vi="nvim"
alias lg="lazygit"

export CLICOLOR="1"
export PROMPT="%~ ::: "
export KEYTIMEOUT=1
export ESCDELAY=0
export EDITOR="nvim"
export PATH="$HOME/.cargo/bin:$HOME/go/bin:/usr/local/go/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/usr/sbin"
