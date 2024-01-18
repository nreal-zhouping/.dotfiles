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

	    #lsp support
      sudo apt-get npm
	    sudo npm i -g pyright
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


echo "安装各种language-server"
echo "先安装npm"

sudo mkdir /etc/apt/keyrings/
sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && sudo apt-get install nodejs -y

sudo npm install -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server
sudo snap install clangd; sudo apt-get install clangd-10; sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100

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
