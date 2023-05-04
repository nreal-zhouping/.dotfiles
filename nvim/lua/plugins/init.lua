vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- base plugin
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })
	-- theme and color
	--tokyonight
	use("folke/tokyonight.nvim")
	--use {'tjdevries/colorbuddy.vim'}
	--use {'Th3Whit3Wolf/onebuddy'}
	--use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
	---- use {'p00f/nvim-ts-rainbow'}
	---- buffer | statusline | icon | treeview | startup buffer
	--use {'glepnir/dashboard-nvim'}
	----use {'kyazdani42/nvim-web-devicons'}

	--nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		-- config = function() require'nvim-tree'.setup {} end
	})

	--bufferline
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

	----bufferline 就是把 buffer 显示成类似 VSCode 中 Tab 页的形式
	--use {
	--  'akinsho/nvim-bufferline.lua',
	--  requires = 'kyazdani42/nvim-web-devicons',
	--  config = require('plugins.bufferline')
	--}

	-- status line
	-- lualine
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")

	-- telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- telescope extensions
	use("LinArcX/telescope-env.nvim")

	-- dashboard-nvim
	use("glepnir/dashboard-nvim")

	-- project
	use("ahmedkhalf/project.nvim")

	--treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	------------------- LSP --------------------
	-- lspconfig
	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })

	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- snippet 引擎
	use("hrsh7th/vim-vsnip")
	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	-- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")

	-- 代码格式化
	-- use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	use("mhartington/formatter.nvim")

	-- indent-blankline
	--use('lukas-reineke/indent-blankline.nvim')
	--use {'glepnir/galaxyline.nvim', branch = 'main', config = function() require('plugins.eviline') end}

	-- treesitter and treesitter base plug
	--use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('plugins.treesitter')}
	--use {'nvim-treesitter/nvim-treesitter-textobjects'}
	--use {'nvim-treesitter/nvim-treesitter-refactor'}
	--use {'lewis6991/spellsitter.nvim', config = require('plugins.spellsitter')}

	-- JSON 增强
	use("b0o/schemastore.nvim")
	-- auto change root dir
	use({
		"ahmedkhalf/lsp-rooter.nvim",
		config = function()
			require("lsp-rooter").setup()
		end,
	})

	-- markdown preview
	use({ "npxbr/glow.nvim", run = ":GlowInstall" })

	--editing
	use({ "windwp/nvim-autopairs", config = require("plugins.autopairs") })

	-- lsp auto completion
	-- use {'hrsh7th/vim-vsnip'}
	use({ "hrsh7th/vim-vsnip-integ" })
	-- use {'hrsh7th/nvim-cmp', config = require('plugins.cmp')}
	-- use {'hrsh7th/cmp-vsnip'}
	-- use {'hrsh7th/cmp-buffer'}
	-- use {'hrsh7th/cmp-nvim-lsp'}
	-- use {'hrsh7th/cmp-path'}
	use({ "f3fora/cmp-spell" })
	-- use {'tzachar/cmp-tabnine', run='./install.sh'}
	use({ "kristijanhusak/vim-dadbod-completion" })

	-- lsp setup
	-- use {'neovim/nvim-lspconfig'}
	-- use {'williamboman/nvim-lsp-installer'}
	use({ "simrat39/symbols-outline.nvim" })
	-- use {'ray-x/lsp_signature.nvim', config = require('plugins.lsp_signature')}
	-- use {'mhartington/formatter.nvim', config = require('plugins.formatter')}
	use({ "RishabhRD/popfix" })
	use({
		"RishabhRD/nvim-lsputils",
		config = function()
			require("plugins.lsputils")
		end,
	})
	use({
		"norcalli/snippets.nvim",
		config = function()
			require("snippets").use_suggested_mappings()
		end,
	})
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})
	-- Lua
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.whichkey-nvim")
		end,
	})
	use({ "nanotee/sqls.nvim", config = require("plugins.sqlls") })
	use({ "onsails/lspkind-nvim", config = require("plugins.lspkind") })
	-- wrapper for jdtls
	use({ "mfussenegger/nvim-jdtls" })
end)

-- 每次保存 plugins.lua 自动安装插件
--pcall(
--  vim.cmd,
--  [[
--    augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--    augroup end
--  ]]
--)
