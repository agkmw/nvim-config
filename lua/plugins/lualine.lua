return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        component_separators = "",
        theme = "auto",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            file_status = true,
          },
          {
            "harpoon2",
            separator = { left = "", right = "" },
          },
        },
      },
    })
  end,
}
