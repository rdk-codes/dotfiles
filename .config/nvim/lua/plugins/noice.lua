return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			notify = false, -- Disable nvim-notify integration
		},
		notify = {
			enabled = false, -- Disable hijacking of vim.notify
		},
		-- You can keep or remove other options as you like
	},
}
