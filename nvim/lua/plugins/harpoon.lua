return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({})

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
    end

    vim.keymap.set("n", "<C-e>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<leader>k1", function()
      harpoon:list():replace_at(1)
    end)
    vim.keymap.set("n", "<leader>k2", function()
      harpoon:list():replace_at(2)
    end)
    vim.keymap.set("n", "<leader>k3", function()
      harpoon:list():replace_at(3)
    end)
    vim.keymap.set("n", "<leader>k4", function()
      harpoon:list():replace_at(4)
    end)
    vim.keymap.set("n", "<leader>k5", function()
      harpoon:list():replace_at(5)
    end)
    vim.keymap.set("n", "<leader>k6", function()
      harpoon:list():replace_at(6)
    end)
    vim.keymap.set("n", "<leader>k7", function()
      harpoon:list():replace_at(7)
    end)
    vim.keymap.set("n", "<leader>k8", function()
      harpoon:list():replace_at(8)
    end)
    vim.keymap.set("n", "<leader>k9", function()
      harpoon:list():replace_at(9)
    end)

    vim.keymap.set("n", "<leader>j1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>j2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>j3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>j4", function()
      harpoon:list():select(4)
    end)
    vim.keymap.set("n", "<leader>j5", function()
      harpoon:list():select(5)
    end)
    vim.keymap.set("n", "<leader>j6", function()
      harpoon:list():select(6)
    end)
    vim.keymap.set("n", "<leader>j7", function()
      harpoon:list():select(7)
    end)
    vim.keymap.set("n", "<leader>j8", function()
      harpoon:list():select(8)
    end)
    vim.keymap.set("n", "<leader>j9", function()
      harpoon:list():select(9)
    end)

    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}
