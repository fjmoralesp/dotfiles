require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['if'] = '@function.innerll',
        ['af'] = '@function.outer',
        ['ia'] = '@parameter.innerll',
        ['aa'] = '@parameter.innerll',
      }
    }
  }
})
