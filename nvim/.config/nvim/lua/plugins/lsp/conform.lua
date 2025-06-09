return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({
					async = false,
					lsp_fallback = true,
					timeout_ms = 1000,
				})
			end,
			mode = { "n", "v" },
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,

		format_on_save = function(bufnr)
			local disable_filetypes = {}
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 1000,
					lsp_fallback = true,
				}
			end
		end,

		formatters_by_ft = {
			lua = { "stylua" },
			python = {
				"ruff_organize_imports",
				"ruff_fix",
				"ruff_format",
			},
		},

		formatters = {
			-- Ruff Format (like black)
			ruff_format = {
				command = "ruff",
				args = { "format", "-" },
				stdin = true,
			},
			-- Ruff Fix (like ruff check --fix)
			ruff_fix = {
				command = "ruff",
				args = { "check", "--fix", "--exit-zero", "-" },
				stdin = true,
			},
			-- Ruff Import Organizer (like ruff check --fix --select I)
			ruff_organize_imports = {
				command = "ruff",
				args = { "check", "--fix", "--exit-zero", "--select", "I", "-" },
				stdin = true,
			},
		},
	},
}
