return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'nui.nvim' },
    config = function()
        local actions = require('telescope.actions')
        local telescope = require('telescope')

        telescope.setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        preview_width = 0.5,
                        width = 0.9,
                        height = 0.9,
                    },
                },
                file_ignore_patterns = { "node_modules", ".exe", ".md" },
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    previewer = true,
                },
                git_files = {
                    previewer = true,
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
}

