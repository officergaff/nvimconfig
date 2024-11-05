return {
	{
		"neoclide/coc.nvim",
		branch = "release",
		build = "npm ci", -- Ensures dependencies are installed
		config = function()
			-- Key mappings for COC
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

			-- Function to check backspace
			_G.check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
			end

			-- Additional useful keybindings
			vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
			vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
			vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
			vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

			-- Use K to show documentation in preview window
			function _G.show_docs()
				local cw = vim.fn.expand("<cword>")
				if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
					vim.api.nvim_command("h " .. cw)
				elseif vim.api.nvim_eval("coc#rpc#ready()") then
					vim.fn.CocActionAsync("doHover")
				else
					vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
				end
			end
			vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

			-- Highlight the symbol and its references when holding the cursor
			vim.api.nvim_create_augroup("CocGroup", {})
			vim.api.nvim_create_autocmd("CursorHold", {
				group = "CocGroup",
				command = "silent call CocActionAsync('highlight')",
				desc = "Highlight symbol under cursor on CursorHold",
			})
		end,
	},
}
