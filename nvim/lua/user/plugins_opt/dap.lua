local dap = require('dap')
local home = os.getenv('HOME')

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

require('dap').adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = {home .. '/js-debug-dap/src/dapDebugServer.js', '${port}'},
  }
}

require('dap').configurations.javascript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch App',
    program = '${file}',
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
  },
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Tests using react-scripts',
    runtimeExecutable = 'npx',
    runtimeArgs = {'react-scripts', 'test', '--runInBand'},
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
  },
}

require('dap').configurations.typescript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch TypeScript App',
    program = '${file}',
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
  },
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'TypeScript Tests using react-scripts',
    runtimeExecutable = 'npx',
    runtimeArgs = {'react-scripts', 'test', '--runInBand'},
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
  },
}

require('dap').configurations.typescriptreact = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Tests using Vitest',
    runtimeExecutable = 'npx',
    runtimeArgs = {'vitest', 'run'},
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
  },
}

require('dapui').setup({
  layouts = {
    {
      elements = {
        {
          id = 'scopes',
          size = 0.52
        },
        {
          id = 'breakpoints',
          size = 0.16
        },
        {
          id = 'stacks',
          size = 0.16
        },
        {
          id = 'watches',
          size = 0.16
        }
      },
      position = 'left',
      size = 70
    },
    {
      elements = {
        {
          id = 'repl',
          size = 0.5
        },
        {
          id = 'console',
          size = 0.5
        }
      },
      position = 'right',
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
