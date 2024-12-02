return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>",        desc = "Open Diffview" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Open Git History" },
	},
	opts = {
		enhanced_diff_hl = true,
		view = {
			default = { winbar_info = true },
		},
	}
}
