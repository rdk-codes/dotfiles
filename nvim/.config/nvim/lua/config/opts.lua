-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- UI behavior
vim.o.mouse = "a"
vim.o.scrolloff = 10
vim.o.signcolumn = "no"
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.breakindent = true

vim.opt.fillchars:append({ eob = " " })

-- Tabs & indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smartindent = true
vim.o.autoindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- File behavior
vim.o.confirm = true
vim.o.undofile = true
vim.o.swapfile = false
vim.opt.backspace = { "indent", "eol", "start" }
-- vim.o.list = true
