return {
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
             require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "omnisharp", "clangd" }
             })
             require("config.mason")
         end,
    },
    {
    	"neovim/nvim-lspconfig",
    	config = function()
            -- local lspconf = require('config.lsp')
    		-- require("config.lsp")
            -- local lspconfig = require("lspconfig")
            -- lspconfig.omnisharp.setup({})
            -- lspconfig.lua_ls.setup({
                -- on_attach = lspconf.custom_attach,
            -- })
            -- require("config.lsp")
    	end,
    },
}
