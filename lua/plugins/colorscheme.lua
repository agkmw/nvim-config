return {
  {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      no_italic = false,
      transparent_background = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = {},
        types = {},
        operators = {},
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
  },
  {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = true
        -- vim.cmd.colorscheme('gruvbox-material')
      end
    }
}
