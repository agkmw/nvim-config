require("agkmw.remap")
print("hello from agkmw")
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.o.textwidth = 80
vim.o.cursorline = true
vim.opt.guicursor = "n-v-c:block,i:block,r-cr:hor20,o:hor50"

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

