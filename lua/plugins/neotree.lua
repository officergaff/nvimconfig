return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		window = {
			close_if_last_window = true,
		}
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			-- Your existing Neotree configuration options go here
		})

		-- Auto-refresh functionality
		vim.api.nvim_create_autocmd({ "DirChanged" }, {
			pattern = "*",
			callback = function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd("Neotree refresh")
				else
					vim.cmd("Neotree reveal")
				end
			end,
		})
	end,
}
