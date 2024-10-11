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
export PATH="$HOME/.vim/plugged/fzf/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/go/bin:$HOME/.local/bin:/snap/bin:/usr/local/bin:/usr/bin:/usr/sbin"


export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
. <(~/.vim/plugged/fzf/bin/fzf --zsh)
