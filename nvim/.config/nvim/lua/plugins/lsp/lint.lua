return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			desc = "Lint file",
		},
	},
	opts = {
		linters_by_ft = {
			python = {
				"ruff",
			},
		},
	},
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		local augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
