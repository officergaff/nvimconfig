return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Languages to install parsers for
				ensure_installed = {
					"rust",
					"lua",
					"html",
					"javascript",
					"typescript",
					"tsx",
					"css",
					"json",
				},
				highlight = { enable = true }, -- Enables syntax highlighting
				indent = { enable = true }, -- Enables smart indentation
			})
		end,
	},
}
