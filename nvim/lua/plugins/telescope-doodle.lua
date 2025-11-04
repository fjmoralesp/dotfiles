return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "apdot/doodle", -- Ensure doodle is a dependency
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        doodle = {}, -- Enable the doodle extension
      },
    })
    -- Load the extension
    telescope.load_extension("doodle")

    -- Example keymaps for doodle's telescope pickers
    local keymap = vim.keymap.set
    keymap("n", "<leader>dd", function()
      telescope.extensions.doodle.find_notes()
    end, { desc = "Doodle Find Notes" })

    keymap("n", "<leader>ff", function()
      telescope.extensions.doodle.find_files()
    end, { desc = "Doodle Find Files" })

    keymap("n", "<leader>dy", function()
      telescope.extensions.doodle.find_templates()
    end, { desc = "Doodle Find Templates" })
  end,
}
