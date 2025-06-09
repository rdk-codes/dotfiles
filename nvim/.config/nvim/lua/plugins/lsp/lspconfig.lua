return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = { window = { winblend = 0 } },
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
					},
				},
			},
			pylsp = {},
		}

		for name, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
			lspconfig[name].setup(config)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user-lsp", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("K", function()
					vim.lsp.buf.hover({ border = "rounded", max_width = 80, max_height = 20 })
				end, "Hover Doc")
				map("<leader>gn", vim.lsp.buf.rename, "Rename")
				map("<leader>ga", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
				map("<leader>gr", require("telescope.builtin").lsp_references, "References")
				map("<leader>gi", require("telescope.builtin").lsp_implementations, "Implementations")
				map("<leader>gd", require("telescope.builtin").lsp_definitions, "Definitions")
				map("<leader>gD", vim.lsp.buf.declaration, "Declaration")
				map("<leader>gt", require("telescope.builtin").lsp_type_definitions, "Type Definitions")
				map("<leader>go", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("<leader>gw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method("textDocument/inlayHint") then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle Inlay Hints")
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					return diagnostic.message
				end,
			},
		})
	end,
}
