if not vim.g.vscode then
    return {
        "nvim-tree/nvim-tree.lua",
        event = { "VeryLazy" },
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("config.nvim-tree")
        end,
    }
end
return {}
