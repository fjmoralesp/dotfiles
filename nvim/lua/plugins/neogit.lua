return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    require("neogit").setup({
      integrations = {
        telescope = true,
      },
    })
    vim.keymap.set("n", "<leader>gd", ":Neogit<CR>")
  end,
}
