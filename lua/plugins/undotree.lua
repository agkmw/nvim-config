return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_DiffCommand = "FC"
		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
	end,
}
