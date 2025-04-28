vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

-- Move the selected range
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "Y", "yg$")

-- Take the line below and append it to the current line with the space
vim.keymap.set("n", "J", "mzJ`z")

-- Keep the cursor remain the same when jumping up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete the highlighted word into the void register and paste it over
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to the void register
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", function()
--    vim.lsp.buf.format()
--end)

-- Quickfix list and location list navigations
vim.keymap.set("n", "<S-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<S-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<S-d>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<S-s>", "<cmd>lnext<CR>zz")

-- Replace the word the cursor is on
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>f", function()
    local filetype = vim.bo.filetype
    if filetype == "javascript" or filetype == "typescript" or filetype == "json" or filetype == "html" or filetype == "css" or filetype == "javascriptreact" then
        vim.cmd("!prettier --write %")
    else
        vim.lsp.but.format()
    end
end)

