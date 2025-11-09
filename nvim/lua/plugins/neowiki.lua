return {
  "echaya/neowiki.nvim",
  opts = {
    wiki_dirs = {
      { name = "Wiki", path = "~/work/wiki" },
    },
  },
  keys = {
    { "<leader>ww", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
  },
}
