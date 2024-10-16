vim.opt.termguicolors = true

require("config.lazy")
require("config.keymaps")

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard:append("unnamedplus")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme mountaineer")
