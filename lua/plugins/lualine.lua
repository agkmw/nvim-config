return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        section_separators = '',
        component_separators = '|',
        theme = "auto",
        opts = function(_, opts)
          local trouble = require("trouble")
          local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal",
          })
          table.insert(opts.sections.lualine_c, {
            symbols.get,
            cond = symbols.has,
          })
        end,
      },
    })
  end,
}
