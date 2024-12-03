return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        local toggleterm = require('toggleterm')
        local Terminal = require('toggleterm.terminal').Terminal

        -- Create lazygit terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            float_opts = { border = "curved" },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = term.bufnr, silent = true })
            end,
        })

        -- Terminal configuration
        toggleterm.setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            direction = 'float',
            float_opts = { border = 'curved' },
            on_open = function(term)
                local opts = { buffer = term.bufnr }
                vim.keymap.set('t', '<C-h>', [[<cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<cmd>wincmd l<CR>]], opts)
            end,
        })

        -- Keymaps
        local function map(key, cmd, desc)
            vim.keymap.set('n', key, cmd, { desc = desc, silent = true })
        end

        map('<leader>tf', '<cmd>ToggleTerm direction=float<cr>', 'Terminal Float')
        map('<leader>th', '<cmd>ToggleTerm size=15 direction=horizontal<cr>', 'Terminal Horizontal')
        map('<leader>tv', '<cmd>ToggleTerm size=60 direction=vertical<cr>', 'Terminal Vertical')
        map('<leader>gg', function() lazygit:toggle() end, 'Lazygit')
    end,
}
