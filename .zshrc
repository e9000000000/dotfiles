set -o emacs
autoload -U compinit; compinit
autoload -U select-word-style

HISTFILE=~/.zsh_history
HISTSIZE=120015
SAVEHIST=120015
setopt appendhistory

select-word-style bash

alias ls="ls --color=auto"
alias lg="lazygit"

export CLICOLOR="1"
export PROMPT="%~ ::: "
export KEYTIMEOUT=1
export ESCDELAY=0
export EDITOR="vim"
export PATH="$HOME/go/bin:/usr/local/go/bin:$HOME/.local/bin:/snap/bin:/usr/local/bin:/usr/bin:/usr/sbin"
