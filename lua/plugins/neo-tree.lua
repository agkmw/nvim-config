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
    vim.keymap.set(
      "n",
      "<leader>e",
      ":Neotree filesystem toggle left<CR>",
      { silent = true, desc = "Toggle Neo-tree" }
    )

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
        width = 40,
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
