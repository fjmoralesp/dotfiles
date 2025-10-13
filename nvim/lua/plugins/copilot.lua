return {
  "zbirenbaum/copilot.lua",
  lazy = false,
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_model = "claude-sonnet-4",
    })
  end,
}
