return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    code = {
      sign = true,
      width = "full",
      right_pad = 0,
    },
    heading = {
      enabled = true,
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    checkbox = {
      enabled = true,
    },
    file_types = { "markdown", "Avante", "codecompanion" },
  },
  ft = { "markdown", "Avante", "codecompanion" },
}
