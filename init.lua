vim.opt.termguicolors = true

require("config.lazy")
require("config.keymaps")

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard:append("unnamedplus")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme dracula")

-- Enable both horizontal and vertical cursor lines
vim.opt.cursorline = true   -- Highlight the line of the cursor
vim.opt.cursorcolumn = true -- Highlight the column of the cursor

-- Reload vimrc
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Source vimrc" })

-- Reload current file
vim.keymap.set("n", "<leader>sf", ":source %<CR>", { desc = "Source current file" })

-- Make searches case-insensitive unless they contain uppercase letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.tabstop = 4        -- How many columns a tab counts for
vim.opt.softtabstop = 4    -- How many columns when you hit Tab in insert mode
vim.opt.shiftwidth = 4     -- How many columns of indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting on new lines
