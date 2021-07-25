# Arch
My arch setup

![](https://i.imgur.com/tOu9OZ4.jpg)
![](https://i.imgur.com/8pURTgO.jpg)

task               | solution
------------------ | ---
os                 | arch
shell              | fish
de                 | i3-gaps
theme              | minimal Dark
icons              | Breeze Dark
browser            | firefox
filemanager        | pcmanfm
code editor        | code
text editor        | neovim

# Installation
Install arch linux by official guide until after chrooting moment, after it configure and run `install.sh`, and reboot.
Next to basic installation run `setup.sh`.
To install nvidia drivers run `bash scripts/nvidia_drivers.sh`.
If your gpu is not nvidia maybe you shood remove 3 first lines in your `.xinitrc`.

# Customisation
dns configuration
```
nmcli con # to know your connection name
nmcli con mod "connection name" ipv4.dns "8.8.8.8 8.8.4.4"
```

# apps settings
## firefox extensions
* uBlock Origin
* SponsorBlock
* Dark Reader
* Cookie-Editor
* SoundFixer
* YouTube NonStop
* TTV LOL
* Now Streaming - Twitch

## tor extensions
* Trace
* Canvas Defender
* AudioContext Fingerprint Defender
* uBlock Origin

## vscode extensions
* Theme - VDark
* Vim
* GitLens
* Python
* Docker
