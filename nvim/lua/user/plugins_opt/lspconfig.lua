require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Json 
require('lspconfig').jsonls.setup({ capabilities = capabilities })

-- Lua
require('lspconfig').lua_ls.setup({ capabilities = capabilities })

-- Typescript, Javascript
require('lspconfig').vtsls.setup({ capabilities = capabilities })

-- Tailwind
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- Kotlin
require('lspconfig').kotlin_language_server.setup({
  capabilities = capabilities,
  init_options = {
    storagePath = os.getenv("HOME") .. "/.cache",
  }
})

-- Python
vim.lsp.enable('pyright')

-- Keymaps
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')

-- Sign configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  },
  underline = false,
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
