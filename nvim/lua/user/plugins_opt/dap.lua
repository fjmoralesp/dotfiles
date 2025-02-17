local dap = require('dap')

dap.adapters.kotlin = {
  type = 'executable',
  command = 'kotlin-debug-adapter',
  options = { auto_continue_if_many_stopped = false },
}

dap.configurations.kotlin = {
  {
    type = 'kotlin',
    request = 'attach',
    name = 'Kotlin DAP',
    port = 5005,
    args = {},
    projectRoot = vim.fn.getcwd(),
    hostName = 'localhost',
    timeout = 10000,
  },
}

require('dapui').setup()

-- Keymaps
vim.keymap.set('n', '<A-8>', [[<cmd>lua require('dapui').toggle()<CR>]])
vim.keymap.set('n', '<A-9>', [[<cmd>lua require('dap').toggle_breakpoint()<CR>]])
vim.keymap.set('n', '<A-0>', [[<cmd>lua require('dap').continue()<CR>]])
vim.keymap.set('n', '<A-->', [[<cmd>lua require('dap').step_over()<CR>]])
vim.keymap.set('n', '<A-=>', [[<cmd>lua require('dap').step_into()<CR>]])
