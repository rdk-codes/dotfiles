return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.statusline").setup()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.indentscope").setup({
			symbol = "▏",
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "oil", "lazy", "Mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			}),
		})
	end,
}
