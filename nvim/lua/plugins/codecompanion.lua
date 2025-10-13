return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    "j-hui/fidget.nvim",
    "ravitemer/mcphub.nvim",
  },
  config = function()
    -- Spinner integration with Fidget
    local progress = require("fidget.progress")

    local Spinner = {}

    function Spinner:init()
      local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionRequestStarted",
        group = group,
        callback = function(request)
          local handle = Spinner:create_progress_handle(request)
          Spinner:store_progress_handle(request.data.id, handle)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionRequestFinished",
        group = group,
        callback = function(request)
          local handle = Spinner:pop_progress_handle(request.data.id)
          if handle then
            Spinner:report_exit_status(handle, request)
            handle:finish()
          end
        end,
      })
    end

    Spinner.handles = {}

    function Spinner:store_progress_handle(id, handle)
      self.handles[id] = handle
    end

    function Spinner:pop_progress_handle(id)
      local handle = self.handles[id]
      self.handles[id] = nil
      return handle
    end

    function Spinner:create_progress_handle(request)
      return progress.handle.create({
        title = " Requesting assistance (" .. request.data.strategy .. ")",
        message = "In progress...",
        lsp_client = {
          name = self:llm_role_title(request.data.adapter),
        },
      })
    end

    function Spinner:llm_role_title(adapter)
      local parts = {}
      table.insert(parts, adapter.formatted_name)
      if adapter.model and adapter.model ~= "" then
        table.insert(parts, "(" .. adapter.model .. ")")
      end
      return table.concat(parts, " ")
    end

    function Spinner:report_exit_status(handle, request)
      if request.data.status == "success" then
        handle.message = "Completed"
      elseif request.data.status == "error" then
        handle.message = " Error"
      else
        handle.message = "󰜺 Cancelled"
      end
    end

    -- ⚠️ You must call `init()` to activate the spinner hooks
    Spinner:init()

    -- Setup McpHub
    require("mcphub").setup({
      auto_approve = true,
    })

    -- Setup CodeCompanion
    require("codecompanion").setup({
      display = {
        chat = {
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
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true,
            make_vars = true,
            make_slash_commands = true,
          },
        },
        history = {
          enabled = true,
          opts = {
            auto_save = true,
            picker = "telescope",
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
      },
    })
  end,
}
