return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>" , { desc = "Toggle Neo-tree" } )
    vim.keymap.set("n", "<leader>nf", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })

    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
            },
          },
        },
        width = 30,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    })
  end,
}
