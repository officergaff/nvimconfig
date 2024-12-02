return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        direction = 'float',
        float_opts = {
            border = 'curved',
            winblend = 0,
        },
        on_open = function(term)
            -- Terminal keymaps
            vim.keymap.set('t', '<esc>', '<C-\\><C-n>', { buffer = term.bufnr })
            vim.keymap.set('t', 'jk', '<C-\\><C-n>', { buffer = term.bufnr })
            vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<CR>', { buffer = term.bufnr })
            vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>', { buffer = term.bufnr })
            vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>', { buffer = term.bufnr })
            vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<CR>', { buffer = term.bufnr })
        end,
    },
    keys = {
        { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",              desc = "Terminal Float" },
        { "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", desc = "Terminal Horizontal" },
        { "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<cr>",   desc = "Terminal Vertical" },
    },
}
