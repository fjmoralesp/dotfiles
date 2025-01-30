local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    path_display = { truncate = 1 },
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      }
    },
    file_ignore_patterns = { '.git/' },
  },
  picers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
})

require('telescope').load_extension('live_grep_args')

vim.keymap.set('n', '<C-space>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
