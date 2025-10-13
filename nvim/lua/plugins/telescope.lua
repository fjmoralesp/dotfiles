return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-telescope/telescope-live-grep-args.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "OliverChao/telescope-picker-list.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        path_display = { truncate = 1 },
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<A-Down>"] = actions.cycle_history_next,
            ["<A-Up>"] = actions.cycle_history_prev,
          },
        },
        file_ignore_patterns = { ".git/", "bin/", "dist/", "build/", "node_modules/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        oldfiles = {
          prompt_title = "History",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")

    -- picker_list must be the last one
    require("telescope").load_extension("picker_list")
  end,
}
