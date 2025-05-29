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
          [']]'] = '@class.outer',
          [']m'] = '@function.outer',
          [']n'] = '@block.outer',
          [']a'] = '@parameter.inner',
        },
        goto_next_end = {
          [']['] = '@class.outer',
          [']M'] = '@function.outer',
          [']N'] = '@block.outer',
          [']A'] = '@parameter.inner',
        },
        goto_previous_start = {
          ['[['] = '@class.outer',
          ['[m'] = '@function.outer',
          ['[n'] = '@block.outer',
          ['[a'] = '@parameter.inner',
        },
        goto_previous_end = {
          ['[]'] = '@class.outer',
          ['[M'] = '@function.outer',
          ['[N'] = '@block.outer',
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
          ['an'] = '@block.outer',
          ['in'] = '@block.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['a/'] = '@comment.outer',
          ['i/'] = '@comment.inner',
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
        },
      },
    },
  })
