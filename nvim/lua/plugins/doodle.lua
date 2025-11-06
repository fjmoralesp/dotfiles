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
      "<leader>ddf",
      function()
        require("doodle"):toggle_finder()
      end,
      desc = "Doodle Finder",
    },
    {
      "<leader>dds",
      function()
        require("doodle"):sync()
      end,
      desc = "Doodle Sync",
    },
    {
      "<leader>ddl",
      function()
        require("doodle"):toggle_links()
      end,
      desc = "Doodle Links",
    },
  },
}
