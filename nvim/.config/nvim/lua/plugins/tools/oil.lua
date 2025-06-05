return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		default_file_explorer = true,
		delete_to_trash = false,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<leader>e"] = "actions.close",
			["<C-s>"] = "actions.select_vsplit", -- optional
			["<C-x>"] = "actions.select_split", -- optional
		},
	},
	keys = {
		{
			"<leader>e",
			"<cmd>Oil<CR>",
			desc = "Open Oil file explorer in current window",
		},
	},
}
