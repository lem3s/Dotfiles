local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
--packer.init {
--  display = {
--    open_fn = function()
--      return require("packer.util").float { border = "rounded" }
--    end,
--  },
--}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Colorscheme
	use("sainnhe/gruvbox-material")
	use("norcalli/nvim-colorizer.lua")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- Status Line
	use("nvim-lualine/lualine.nvim")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- Comment lines faster
	use("numToStr/Comment.nvim")

	-- Fuzzy Finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", brach = "0.1.x" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Indentation lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Git signs
	use("lewis6991/gitsigns.nvim")

	-- Formatter
	use("mhartington/formatter.nvim")

	-- Change html tags
	use("AndrewRadev/tagalong.vim")

	-- Better navigation
	use("christoomey/vim-tmux-navigator")

	-- Code Screenshots
	use("sudoerwx/vim-ray-so-beautiful")
	use("kristijanhusak/vim-carbon-now-sh")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
