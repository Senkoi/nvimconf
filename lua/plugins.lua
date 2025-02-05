local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- color scheme
	{
		"tiagovla/tokyodark.nvim"
	},
	-- Auto-completeion
	{
		 "iguanacucumber/magazine.nvim",
		 name = "nvim-cmp",
		 -- event = 'InsertEnter',
		 event = "VeryLazy",
		 dependencies = {
		   "hrsh7th/cmp-nvim-lsp",
		   "onsails/lspkind-nvim",
		   "hrsh7th/cmp-path",
		   "hrsh7th/cmp-buffer",
		   "hrsh7th/cmp-omni",
		   "quangnguyen30192/cmp-nvim-ultisnips",
		 },
		 config = function()
		   require("config.nvim-cmp")
		 end,
	},
	{
		"SirVer/ultisnips", dependencies = {
			"honza/vim-snippets",

		}, event = "InsertEnter" 
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = { "VeryLazy" },
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
            -- require("config.lsp")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			-- require("config.lsp")
			require("mason").setup()
		end,
	},
    {
		"williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
            require("config.mason")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- configuration goes here
            lang = "csharp",
        },
    },
})
