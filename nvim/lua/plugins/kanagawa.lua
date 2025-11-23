return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "kanagawa",
        callback = function()
          vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
        end,
      })
    end,
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
          WinSeparator = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
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
