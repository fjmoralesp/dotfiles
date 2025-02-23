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

dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = 'Java DAP',
    port = 8089,
    args = {},
    hostName = 'localhost',
    timeout = 10000,
  },
}

require('dapui').setup({
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.52
        },
        {
          id = "breakpoints",
          size = 0.16
        },
        {
          id = "stacks",
          size = 0.16
        },
        {
          id = "watches",
          size = 0.16
        }
      },
      position = "left",
      size = 70
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5
        },
        {
          id = "console",
          size = 0.5
        }
      },
      position = "right",
      size = 50
    }
  },
})

-- Keymaps
vim.keymap.set('n', '<A-8>', [[<cmd>lua require('dapui').toggle()<CR>]])
vim.keymap.set('n', '<A-9>', [[<cmd>lua require('dap').toggle_breakpoint()<CR>]])
vim.keymap.set('n', '<A-0>', [[<cmd>lua require('dap').continue()<CR>]])
vim.keymap.set('n', '<A-->', [[<cmd>lua require('dap').step_over()<CR>]])
vim.keymap.set('n', '<A-=>', [[<cmd>lua require('dap').step_into()<CR>]])
