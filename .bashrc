export PS1="\w ::: "

complete -cf doas

export ESCDELAY=0
export EDITOR="vim"
export PATH="$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/usr/sbin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ "$(tty)" = "/dev/tty1" ] && exec startx
