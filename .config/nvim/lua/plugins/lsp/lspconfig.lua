return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Setup language servers
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })

			-- Keymaps for LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local bufnr = args.buf
					local opts = { buffer = bufnr, silent = true }

					local keymap = vim.keymap.set

					-- 🌐 Jump to Definition
					keymap(
						"n",
						"gd",
						"<cmd>Telescope lsp_definitions<CR>",
						vim.tbl_extend("force", opts, { desc = "Go to Definition (Telescope)" })
					)
					-- 🔄 Jump to Declaration (usually variable/function declaration)
					keymap(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						vim.tbl_extend("force", opts, { desc = "Go to Declaration" })
					)
					-- 🌍 Jump to Implementation (e.g. method implementation)
					keymap(
						"n",
						"gi",
						"<cmd>Telescope lsp_implementations<CR>",
						vim.tbl_extend("force", opts, { desc = "Go to Implementation (Telescope)" })
					)
					-- 📚 Find References (all usages of the symbol)
					keymap(
						"n",
						"gr",
						"<cmd>Telescope lsp_references<CR>",
						vim.tbl_extend("force", opts, { desc = "Find References (Telescope)" })
					)
					-- 📖 Hover Documentation (shows info about symbol)
					keymap(
						"n",
						"K",
						vim.lsp.buf.hover,
						vim.tbl_extend("force", opts, { desc = "Show Hover Documentation" })
					)
					-- 🛠️ Code Actions (e.g. quick fixes, refactoring)
					keymap(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "Code Actions" })
					)
					-- 🔠 Rename Symbol (variable, function, etc.)
					keymap(
						"n",
						"<leader>rn",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Rename Symbol" })
					)
					-- 📝 Show Diagnostics (in floating window)
					keymap(
						"n",
						"<leader>d",
						vim.diagnostic.open_float,
						vim.tbl_extend("force", opts, { desc = "Show Diagnostics" })
					)
					-- 🔄 Restart LSP
					keymap(
						"n",
						"<leader>rs",
						"<cmd>LspRestart<CR>",
						vim.tbl_extend("force", opts, { desc = "Restart LSP" })
					)
					-- 🔍 Go to Previous Diagnostic
					keymap(
						"n",
						"[d",
						vim.diagnostic.goto_prev,
						vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" })
					)
					-- 🔍 Go to Next Diagnostic
					keymap(
						"n",
						"]d",
						vim.diagnostic.goto_next,
						vim.tbl_extend("force", opts, { desc = "Next Diagnostic" })
					)
				end,
			})
		end,
	},
}
