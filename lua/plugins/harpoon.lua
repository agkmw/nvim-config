return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {
      desc = "Harpoon: Add file",
    })

    vim.keymap.set("n", "<C-o>", function() toggle_telescope(harpoon:list()) end, {
      desc = "Harpoon: Open via Telescope",
    })

    vim.keymap.set("n", "<S-h>", function() harpoon:list():select(1) end, {
      desc = "Harpoon: Go to file 1",
    })
    vim.keymap.set("n", "<S-j>", function() harpoon:list():select(2) end, {
      desc = "Harpoon: Go to file 2",
    })
    vim.keymap.set("n", "<S-k>", function() harpoon:list():select(3) end, {
      desc = "Harpoon: Go to file 3",
    })
    vim.keymap.set("n", "<S-l>", function() harpoon:list():select(4) end, {
      desc = "Harpoon: Go to file 4",
    })

    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, {
      desc = "Harpoon: Previous file",
    })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, {
      desc = "Harpoon: Next file",
    })

  end,
}
