# arch_setup
My arch setup

![](https://i.imgur.com/tOu9OZ4.jpg)

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
Default install arch linux, afret chroot configure and run `install.sh`.
After basic install run `setup.sh`.
to install nvidia drivers run `bash scripts/nvidia_drivers.sh`
if your gpu is not nvidia maybe you shood remove first 3 lines in your `.xinitrc`

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
