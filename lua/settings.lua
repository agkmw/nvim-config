vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 8

vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = "80"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.showbreak = '↪'

vim.opt.swapfile = false
vim.opt.backup = false

local home = os.getenv("HOME") or os.getenv("USERPROFILE") or "/tmp"
vim.opt.undodir= home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

