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
-- local plugins = {
-- 	-- color scheme
-- 	-- {
-- 	-- 	"tiagovla/tokyodark.nvim"
-- 	-- },
-- 	-- Auto-completeion
--     {
--         "jay-babu/mason-nvim-dap.nvim",
--         "mufssenegger/nvim-dap",
--         config = function()
--             require("config.dap")
--         end,
--     },
--     { 
--         "rcarriga/nvim-dap-ui",
--         dependencies = {
--             "mfussenegger/nvim-dap",
--             "nvim-neotest/nvim-nio"
--         }
--     },
-- }
require("lazy").setup("plugins")
-- require("lazy").setup(plugins)
