return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            -- preview_config = {
            --     border = "rounded",
            --     style = "default",
            -- },
        })
    end,

--     vim.cmd [[
--       highlight GitSignsAdd guifg=#00FF00 guibg=#002200 ctermfg=2 ctermbg=0
--       highlight GitSignsChange guifg=#FFFF00 guibg=#222200 ctermfg=3 ctermbg=0
--       highlight GitSignsDelete guifg=#FF0000 guibg=#220000 ctermfg=1 ctermbg=0
--     ]],
}
