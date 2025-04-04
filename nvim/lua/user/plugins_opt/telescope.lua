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
        ['<A-Down>'] = actions.cycle_history_next,
        ['<A-Up>'] = actions.cycle_history_prev,
      }
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    oldfiles = {
      prompt_title = 'History',
    },
  },
})

require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('fzf')
require('telescope').load_extension('pomodori')

vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<C-f>', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<CR>]])
vim.keymap.set('n', '<leader>D', ':Telescope diagnostics<CR>')

vim.keymap.set('n', '<leader>t', function()
  require('telescope').extensions.pomodori.timers()
end, { desc = 'Manage Pomodori Timers'})
