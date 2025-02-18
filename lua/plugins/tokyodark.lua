return {
    "tiagovla/tokyodark.nvim",
    opts = {

        custom_highlights = function(highlights, palette)
            highlights.Visual = { fg = "#FFFFFF", bg = "#5A5A5A" }
            highlights.VisualNOS = { fg = "#FFFFFF", bg = "#5A5A5A" }
            highlights.CursorLine = { bg = "#2E2E2E" }
            highlights.DiffAdd = { fg= "#A8E06A", bg = "#1E2A1D"}

            return highlights
        end,
    },
    config = function(_, opts)
        local tokyodark = require("tokyodark")
        tokyodark.setup(opts)
        vim.cmd([[colorscheme tokyodark]])
    end,
}
