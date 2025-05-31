return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.doc").setup()
		require("mini.move").setup()

		-- Setup mini.notify and replace vim.notify
		require("mini.notify").setup()
		vim.notify = require("mini.notify").make_notify()
	end,
}
