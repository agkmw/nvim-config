vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<leader>f", function()
    local filetype = vim.bo.filetype
    if filetype == "javascript" or filetype == "typescript" or filetype == "html" then
        vim.cmd("!prettier --write %")
    else
        print("Not a supported file type for Prettier.")
    end
end)

