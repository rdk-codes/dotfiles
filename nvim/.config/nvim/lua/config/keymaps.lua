-- clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set({ "n", "v" }, "<A-p>", '"+p')

-- copying
vim.keymap.set("n", "<A-y>", '"+yy')
vim.keymap.set("v", "<A-y>", '"+y')

-- pasting
vim.keymap.set({ "n", "v" }, "<A-p>", '"+p')

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "diagnostic list" })
