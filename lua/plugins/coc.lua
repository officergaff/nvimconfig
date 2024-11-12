return {
    {
        "neoclide/coc.nvim",
        branch = "release",
        build = "npm ci", -- Ensures dependencies are installed
        config = function()
            -- Utility function to check if we can run a CoC command
            local function can_call_coc()
                return vim.fn.exists(':CocActionAsync') > 0
            end

            -- Function to check backspace for better tab completion
            _G.check_backspace = function()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
            end

            -- Function to show documentation
            _G.show_docs = function()
                local cw = vim.fn.expand("<cword>")
                if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command("h " .. cw)
                elseif vim.api.nvim_eval("coc#rpc#ready()") then
                    vim.fn.CocActionAsync("doHover")
                else
                    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
                end
            end

            -- Completion keymaps
            vim.keymap.set(
                "i",
                "<TAB>",
                [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "<TAB>" : coc#refresh()]],
                { silent = true, noremap = true, expr = true }
            )
            vim.keymap.set(
                "i",
                "<S-TAB>",
                [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]],
                { silent = true, noremap = true, expr = true }
            )
            vim.keymap.set(
                "i",
                "<cr>",
                [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
                { silent = true, noremap = true, expr = true }
            )

            -- Navigation keymaps
            vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true, desc = "Go to definition" })
            vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true, desc = "Go to type definition" })
            vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true, desc = "Go to implementation" })
            vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true, desc = "Go to references" })
            vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true, desc = "Show documentation" })

            -- Diagnostic navigation
            vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", 
                { silent = true, desc = "Previous diagnostic" })
            vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", 
                { silent = true, desc = "Next diagnostic" })

            -- Error navigation
            vim.keymap.set("n", "[e", function()
                if can_call_coc() then
                    vim.fn.CocAction('diagnosticPrevious', 'error')
                end
            end, { silent = true, desc = "Previous error" })
            
            vim.keymap.set("n", "]e", function()
                if can_call_coc() then
                    vim.fn.CocAction('diagnosticNext', 'error')
                end
            end, { silent = true, desc = "Next error" })

            -- Warning navigation
            vim.keymap.set("n", "[w", function()
                if can_call_coc() then
                    vim.fn.CocAction('diagnosticPrevious', 'warning')
                end
            end, { silent = true, desc = "Previous warning" })
            
            vim.keymap.set("n", "]w", function()
                if can_call_coc() then
                    vim.fn.CocAction('diagnosticNext', 'warning')
                end
            end, { silent = true, desc = "Next warning" })

            -- Additional useful mappings
            vim.keymap.set("n", "<leader>d", ":<C-u>CocList diagnostics<cr>", 
                { silent = true, desc = "Show diagnostics list" })
            vim.keymap.set("n", "<leader>m", function()
                if can_call_coc() then
                    vim.fn.CocActionAsync('diagnosticInfo')
                end
            end, { silent = true, desc = "Show diagnostic message" })
            vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", 
                { silent = true, desc = "Symbol rename" })
            vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", 
                { silent = true, desc = "Format selected" })
            vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", 
                { silent = true, desc = "Format selected" })

            -- Highlight symbol under cursor and its references
            vim.api.nvim_create_augroup("CocGroup", {})
            vim.api.nvim_create_autocmd("CursorHold", {
                group = "CocGroup",
                command = "silent call CocActionAsync('highlight')",
                desc = "Highlight symbol under cursor on CursorHold",
            })

            -- Add status line support
            vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
        end,
    },
}
