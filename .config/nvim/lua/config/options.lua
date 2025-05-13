-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 
opt.shiftwidth = 2 
opt.expandtab = true 
opt.autoindent = true 

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true 

opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" 

-- backspace
opt.backspace = "indent,eol,start" 

-- split windows
opt.splitright = true
opt.splitbelow = true 

opt.swapfile = false
