require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
          [']b'] = '@block.outer',
          [']a'] = '@parameter.inner',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
          [']B'] = '@block.outer',
          [']A'] = '@parameter.inner',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
          ['[b'] = '@block.outer',
          ['[a'] = '@parameter.inner',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
          ['[B'] = '@block.outer',
          ['[A'] = '@parameter.inner',
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['a/'] = '@comment.outer',
          ['i/'] = '@comment.outer',
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
        },
      },
    },
  })
