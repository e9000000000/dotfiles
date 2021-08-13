# Arch
My arch setup

task               | solution
------------------ | ---
os                 | arch
terminal           | alacritty
shell              | bash
de                 | bspwm
theme              | minimal Dark
icons              | Breeze Dark
browser            | firefox
code editor        | code
text editor        | neovim

# Installation
Install arch linux by official guide until after chrooting moment, after it configure and run `install.sh`, and reboot.
Next to basic installation run `setup.sh`.

# Customisation
## dns configuration
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
* Vimium
* YouTube NonStop
* TTV LOL
* Now Streaming - Twitch

## tor extensions
* Trace
* Canvas Defender
* AudioContext Fingerprint Defender
* uBlock Origin
