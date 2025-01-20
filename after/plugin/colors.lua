function ColorMyPencils(color, removeBg)
	vim.cmd.colorscheme(color)

    if removeBg then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

ColorMyPencils('rose-pine', true)
