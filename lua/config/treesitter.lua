local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "csharp", "python", "c"}
    highlight = { enable = true },
    indent = { enable = true },

})
