return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "gopls" },
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          ["lua_ls"] = {},
        },
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        settings = {
          ["ts_ls"] = {},
        },
      })
    end,
  }
}
