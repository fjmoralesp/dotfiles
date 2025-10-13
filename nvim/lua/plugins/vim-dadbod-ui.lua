return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.keymap.set("n", "<A-3>", ":DBUIToggle<CR>")
  end,
}
