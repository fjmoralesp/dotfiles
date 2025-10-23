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
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4.5",
        },
      },
      inline = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4.5",
        },
      },
      cmd = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4.5",
        },
      },
    },
    extensions = {
      spinner = {},
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          show_result_in_chat = true, -- Show mcp tool results in chat
          make_vars = true, -- Convert resources to #variables
          make_slash_commands = true, -- Add prompts as /slash commands
        },
      },
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
