return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function ()
    vim.keymap.set("n", "<leader>wk", function()
      require("which-key").show("<leader>", { mode = "n", global = true })
    end, { desc = "Show Leader Keymaps" })
  end,
}

