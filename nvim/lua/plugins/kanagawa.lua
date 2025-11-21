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
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          WinSeparator = { fg = "none", bg = theme.ui.nontext },
        }
      end,
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
