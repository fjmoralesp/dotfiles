return {
  {
    "sainnhe/gruvbox-material",
    dependencies = {
      "sheerun/vim-polyglot",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("set background=dark")
      -- Set contrast.
      -- This configuration option should be placed before `colorscheme gruvbox-material`.
      -- Available values: 'hard', 'medium'(default), 'soft'
      -- vim.g.gruvbox_material_background = "hard"
      -- Available values: 'material', 'mix', 'original'
      -- vim.g.gruvbox_material_foreground = "mix"
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox-material",
  --   },
  -- },
}
