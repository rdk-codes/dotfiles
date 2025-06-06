return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"basedpyright",
				"lua_ls",
			},
			automatic_installation = false,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"ruff",
				"mypy",
			},
		})
	end,
}
