return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.nvim",
  },
  opts = {
    file_types = { "markdown", "codecompanion" },
    completions = { lsp = { enabled = true } },
  },
}
