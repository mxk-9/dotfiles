-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use 'pogyomo/winresize.nvim'
	use 'pogyomo/submode.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	}

	-- Colorschemes
	use { "catppuccin/nvim", as = "catppuccin" }
	use "vv9k/bogster"
	use "ellisonleao/gruvbox.nvim"

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use 'nvim-treesitter/playground'

	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use 'm4xshen/autoclose.nvim'

	-- LSP Support
	use { 'neovim/nvim-lspconfig' }
	-- Autocompletion
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'L3MON4D3/LuaSnip' }

	-- use {
	-- 	'VonHeikemen/lsp-zero.nvim',
	-- 	-- branch = 'v3.x',
	-- 	requires = {
	-- 		-- Autocompletion
	-- 		{ 'hrsh7th/nvim-cmp' },
	-- 		{ 'hrsh7th/cmp-nvim-lsp' },
	-- 		{ 'hrsh7th/cmp-nvim-lua' },
	-- 		{ 'L3MON4D3/LuaSnip' },
	-- 	}
	-- }

	-- Normal commenting
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- That multicursor
	use 'mg979/vim-visual-multi'

	-- Modding Garry's Mod
	-- use 'vim-scripts/gmlua.vim'

	-- Formatter
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
end)
