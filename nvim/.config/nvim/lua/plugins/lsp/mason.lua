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
			ensure_installed = {},
			automatic_installation = false,
		})

		local servers = vim.g._lsp_servers or {}
		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, {
			"stylua",
			"ruff",
			"mypy",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})
	end,
}
