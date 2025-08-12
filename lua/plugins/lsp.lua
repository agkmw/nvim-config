return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
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
				ensure_installed = { "lua_ls", "ts_ls", "gopls", "tailwindcss", "emmet_language_server", "intelephense", "clangd", "prismals" },
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					["ts_ls"] = {},
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- "eslint_d",
					"stylua",
					"prettier",
          "php-cs-fixer",
          "clang-format",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            formatters_by_ft = {
                php = { "php-cs-fixer" },
            },
            formatters = {
                ["php-cs-fixer"] = {
                    command = "php-cs-fixer",
                    args = {
                        "fix",
                        "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
                        "$FILENAME",
                    },
                    stdin = false,
                },
            },
            notify_on_error = true,
        },
    }
}
