require('catppuccin').setup({
    color_overrides = {
      latte = {
        base = '#f0f0f0',
      },
    },
    integrations = {
      telescope = {
        enabled = true,
        style = 'nvchad'
      },
      treesitter = true,
      treesitter_context = true,
      rainbow_delimiters = true,
      gitsigns = true,
      mason = true,
      neogit = true,
      cmp = true,
      dap = true,
      render_markdown = true,
      flash = true,
    }
  })
vim.cmd('colorscheme catppuccin-latte')
-- vim.cmd('colorscheme catppuccin-mocha')
