return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true,
    opts = {
      compile = true,
      undercurl = true,
      functionStyle = { bold = true, italic = true },
      dimInactive = true,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
