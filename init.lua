vim.opt.termguicolors = true

require("config.lazy")
require("config.keymaps")

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard:append("unnamedplus")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme github")

-- Enable both horizontal and vertical cursor lines
vim.opt.cursorline = true   -- Highlight the line of the cursor
vim.opt.cursorcolumn = true -- Highlight the column of the cursor

-- Reload vimrc
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Source vimrc" })

-- Reload current file 
vim.keymap.set("n", "<leader>sf", ":source %<CR>", { desc = "Source current file" })
