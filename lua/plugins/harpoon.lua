return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    local function get_paths(files)
      local paths = {}
      local items = files.items
      local len = files._length

      for i = 1, len do
        paths[i] = ''
        local item = items[i]
        if item ~= nil then
          paths[i] = item.value
        end
      end
      return paths
    end

    local make_finder = function(paths)
      return require("telescope.finders").new_table({
        results = paths,
      })
    end

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = make_finder(get_paths(harpoon_files)),
        previewer = false,
        sorter = conf.generic_sorter({}),
        layout_strategy = "vertical",
        layout_config = {
          width = 80,
          height = 20,
        },
        attach_mappings = function(prompt_buffer_number, map)
          map("i", "<C-d>", function()
            local state = require("telescope.actions.state")
            local selected_entry = state.get_selected_entry()
            local current_picker = state.get_current_picker(prompt_buffer_number)
            harpoon:list():remove_at(selected_entry.index)
            current_picker:refresh(make_finder(get_paths(harpoon:list())))
          end)
          return true
        end,
      })
        :find()
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

    vim.keymap.set("n", "<leader>j", function() harpoon:list():prev() end, {
      desc = "Harpoon: Previous file",
    })
    vim.keymap.set("n", "<leader>k", function() harpoon:list():next() end, {
      desc = "Harpoon: Next file",
    })

  end,
}
