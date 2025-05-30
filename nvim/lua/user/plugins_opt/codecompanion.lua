require('codecompanion').setup({
  strategies = {
    chat = {
      adapter = {
        name = 'anthropic',
        model = 'claude-opus-4-20250514',
      },
    },
    inline = {
      adapter = {
        name = 'anthropic',
        model = 'claude-opus-4-20250514',
      },
    },
  },
  extensions = {
    history = {
      enabled = true,
      opts = {
        auto_save = true,
        picker = 'telescope',
        auto_generate_title = true,
        ---On exiting and entering neovim, loads the last chat on opening chat
        continue_last_chat = false,
        ---When chat is cleared with `gx` delete the chat from history
        delete_on_clearing_chat = false,
        ---Directory path to save the chats
        dir_to_save = vim.fn.stdpath('data') .. '/codecompanion-history',
      }
    }
  }
})

-- keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>av', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })
