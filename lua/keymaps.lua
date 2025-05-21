-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })

vim.keymap.set("n", "<C-m>", "<C-w><S-t>", { desc = "Maximize the window" })
vim.keymap.set("n", "<leader>t", "gt", { desc = "Move to another tab" })
vim.keymap.set("n", "<leader>rw", "<C-w>r<C-w>w", { desc = "Rotate windows and switch focus" })

-- Navigate through buffers
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Replace the word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Substitute word under cursor" })

-- Yank from cursor to end of line (like D/C)
vim.keymap.set("n", "Y", "yg$", { desc = "Yank to end of line" })

-- Move selected text down/up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Append line below to current line with cursor position preserved
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })

-- Centered scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Center search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Paste over selection without losing register content
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without yanking" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank line to system clipboard" })

-- Delete to void register
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete without yanking" })

-- Escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Toggle Undotree
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>", { desc = "Toggle Undotree" })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Format current buffer
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format buffer with LSP" })

-- Quickfix and location list navigation
vim.keymap.set("n", "<S-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<S-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<S-d>", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<S-s>", "<cmd>lnext<CR>zz", { desc = "Next location list item" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Close current buffer
vim.keymap.set("n", "<leader>ca", "<C-w>o", { desc = "Close all windows and focus on the current one" })
vim.keymap.set("n", "<leader>cc", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Move to another window" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal to Normal mode" })
vim.keymap.set("t", "<C-q>", "<Esc>", { desc = "Send Esc to terminal" })

vim.keymap.set("n", "<leader>bdf", ":bd!<CR>", { desc = "Force close buffer" })

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)
