-- my nvim config write in lua
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

--require('basic')
--we used plugin/options.vim
require("plugins")
require("keybindings")
require("colorscheme")
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")

-- :lua print(vim.inspect(vim.lsp.buf_get_clients())) 查看 LSP 连接状态
require("lsp/setup")
require("lsp.cmp")

-- require("lsp.null-ls")
require("lsp.formatter")
