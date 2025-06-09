return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"onsails/lspkind.nvim",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				treesitter_highlighting = true,
				window = {
					border = "rounded",
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
			},

			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
					components = {
						kind_icon = {
							text = function(item)
								local kind = require("lspkind").symbol_map[item.kind] or ""
								return kind .. " "
							end,
							highlight = "CmpItemKind",
						},
						label = {
							text = function(item)
								return item.label
							end,
							highlight = "CmpItemAbbr",
						},
						kind = {
							text = function(item)
								return item.kind
							end,
							highlight = "CmpItemKind",
						},
					},
				},
			},
		},

		signature = {
			enabled = true,
			window = { border = "rounded" },
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},

			providers = {
				lsp = {},
				path = {},
				snippets = {},
				buffer = {},
			},
		},

		snippets = {
			preset = "luasnip",
		},

		fuzzy = {
			implementation = "lua",
		},
	},
}
