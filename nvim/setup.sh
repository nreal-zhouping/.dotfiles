#!/bin/bash
if [[ ! -d ~/.config ]]
then
    mkdir ~/.config
fi

if [[ -d ~/.config/nvim ]]
then
if [[ -d ~/.config/nvim.backup ]]
then
    rm  ~/.config/nvim.backup
fi
    echo "mv ~/.config/nvim ~/.config/nvim.backup"
    mv ~/.config/nvim ~/.config/nvim.backup
fi

ln -sf ~/.dotfiles_huangcan/nvim ~/.config/nvim

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]
then
    echo "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
nvim +PackerSync
echo "Please install language server"
echo "sudo apt install nodejs npm && sudo npm install -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server"
