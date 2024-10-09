return {
  'neoclide/coc.nvim',
  branch = 'release',
  build = function()
    vim.fn.system('npm install')
  end,
  config = function()
    -- Basic coc.nvim configuration
    vim.g.coc_global_extensions = {
      'coc-json',
      'coc-tsserver',
      'coc-rust-analyzer', -- for Rust
      -- Add other coc extensions you want here
    }

    local keyset = vim.keymap.set
    keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
    keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
    keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
    keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

    -- Use K to show documentation in preview window
    function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
        else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
    end
    keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
  end
}
