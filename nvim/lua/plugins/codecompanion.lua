return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ravitemer/codecompanion-history.nvim",
    "franco-ruggeri/codecompanion-spinner.nvim",
  },
  opts = {
    display = {
      chat = {
        show_settings = true,
        window = {
          width = 0.5,
        },
      },
    },
    strategies = {
      chat = {
        adapter = "opencode",
        model = "claude-sonnet-4.5",
      },
    },
    extensions = {
      spinner = {},
      history = {
        enabled = true,
        opts = {
          auto_save = true,
          picker = "telescope",
          auto_generate_title = true,
          ---On exiting and entering neovim, loads the last chat on opening chat
          continue_last_chat = false,
          ---When chat is cleared with `gx` delete the chat from history
          delete_on_clearing_chat = false,
          ---Directory path to save the chats
          dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
        },
      },
    },
  },
}
