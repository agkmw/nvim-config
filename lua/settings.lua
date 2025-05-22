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
vim.opt.showbreak = "↪"

vim.opt.swapfile = false
vim.opt.backup = false

local home = os.getenv("HOME") or os.getenv("USERPROFILE") or "/tmp"
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	vim.o.shell = "pwsh.exe"
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
end

vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_text = true,
	float = true,
	update_in_insert = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"alpha",
		"dashboard",
		"neo-tree",
		"Trouble",
		"lazy",
		"mason",
		"notify",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
