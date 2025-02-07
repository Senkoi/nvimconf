local config_dir = vim.fn.stdpath("config")

require('options')
require('mapping')
require('plugins-loader')
require('colorscheme')

vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml_conf/options.vim"))
vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml_conf/plugins.vim"))
