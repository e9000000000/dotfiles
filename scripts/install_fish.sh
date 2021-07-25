#!/bin/bash

# install fish
sudo pacman -Sy --noconfirm fish

# setup fish as default shell
echo /bin/fish | sudo tee -a /etc/shells
chsh -s /bin/fish

fish -c "fish_add_path ~/.local/bin"
