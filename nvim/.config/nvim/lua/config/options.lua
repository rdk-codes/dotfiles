local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- UI behavior
opt.mouse = "a"
opt.scrolloff = 10
opt.signcolumn = "no"
opt.cursorline = false
opt.termguicolors = true
opt.showmode = false
opt.wrap = false
opt.breakindent = true
opt.fillchars:append({ eob = " " })

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- File behavior
opt.confirm = true
opt.undofile = true
opt.swapfile = false
opt.backspace = { "indent", "eol", "start" }

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Timings
opt.timeoutlen = 300
opt.updatetime = 250
