# vscode

## install
add repo to apt and install codium
```bash
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
```

```bash
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
```

```bash
sudo apt update && sudo apt install codium
```

## extensions
- `amerey.blackplusplus` - black theme
- `usernamehw.errorlens` - errors
- `ms-python.python` - python support
- `ms-pyright.pyright` - python language server (language servers from Python extension double completion list with two workspace folders)
- `humao.rest-client` - rest client
- `asvetliakov.vscode-neovim` - neovim integration