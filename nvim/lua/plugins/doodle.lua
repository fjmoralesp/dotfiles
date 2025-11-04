return {
  "apdot/doodle",
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("doodle").setup({
      settings = {
        git_repo = "/usr/local/doodle/vault",
        sync = true,
      },
    })
  end,
  keys = {
    {
      "<leader>df",
      function()
        require("doodle"):toggle_finder()
      end,
      desc = "Doodle Finder",
    },
    {
      "<leader>ds",
      function()
        require("doodle"):sync()
      end,
      desc = "Doodle Sync",
    },
    {
      "<leader>dl",
      function()
        require("doodle"):toggle_links()
      end,
      desc = "Doodle Links",
    },
  },
}
