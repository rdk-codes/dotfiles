set = vim.keymap.set

set("n", "<Esc>", "<cmd>nohlsearch<CR>")
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
set("v", "<C-y>", '"+y')
set("n", "<C-y>", '"+yy')
