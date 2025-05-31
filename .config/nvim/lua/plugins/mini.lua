return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		-- require('mini.statusline').setup {
		--   use_icons = true
		-- }
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.doc").setup()
		require("mini.move").setup()
		require("mini.trailspace").setup()
	end,
}
