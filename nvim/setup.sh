#!/bin/bash

# 检查是否安装了 nvim
if command -v nvim &> /dev/null; then
    echo "nvim 已经安装."
else
    # 提示用户是否要安装 nvim
    read -p "nvim 未安装，是否要安装？ (y/n): " answer

    # 如果用户选择是，执行安装命令
    if [ "$answer" == "y" ]; then
        echo "开始安装nvim..."
        sudo add-apt-repository ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install neovim
    else
        echo "取消安装."
        exit 1
    fi
fi


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

ln -sf ~/.dotfiles/nvim ~/.config/nvim

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]
then
    echo "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

nvim +PackerSync
echo "Please install language server"
echo "sudo apt install nodejs npm && sudo npm install -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server"
echo "some like: sudo snap install clangd; sudo apt-get install clangd-10; sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100"
echo ""
echo "Add alias:"
echo "ubuntu:"
echo "alias vi='nvim -u /home/zhouping/.config/nvim/init.lua'"
echo "mac:"
echo "alias vi='nvim -u /Users/zhouping/.config/nvim/init.lua'"
