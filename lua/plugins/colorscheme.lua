function Tcat(t)
    t = false or t
    require("catppuccin").setup({
        transparent_background = t
    })
    vim.cmd.colorscheme("catppuccin")
end

function Tgruv(t)
    t = false or t
    if t == true then
        vim.g.gruvbox_material_transparent_background = 0
    end
   vim.cmd.colorscheme("gruvbox-material")
end

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
        vim.g.gruvbox_material_transparent_background = 0
        vim.g.gruvbox_material_float_style = 'dim'
        -- vim.g.gruvbox_material_diagnostic_text_highlight = 1
        -- vim.g.gruvbox_material_diagnostic_line_highlight = 1
        vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
        -- vim.cmd.colorscheme('gruvbox-material')
      end
    }
}
