return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			extend_background_behind_borders = true,
			styles = {
					transparency = true,
			},
			-- palette = { main = { base = "#08080f" } }
		})
		vim.cmd.colorscheme "rose-pine"
	end
}
