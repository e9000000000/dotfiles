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


# preinstallation
to setup network from `arch-chroot`
```
pacman -S networkmanager
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
nmcli con # to know your connection name
nmcli con mod "connection name" ipv4.dns "8.8.8.8 8.8.4.4"
```
# installation
```
git clone https://github.com/e6000000000/arch_setup.git
cd arch_setup
bash setup.sh
reboot
```
to install nvidia drivers run `bash scripts/nvidia_drivers.sh`
if your gpu is not nvidia maybe you shood remove first 3 lines in your `.xinitrc`

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
