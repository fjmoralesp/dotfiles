return {
  "vim-test/vim-test",
  config = function()
    vim.keymap.set("n", "<leader>rn", ":TestNearest<CR>")
    vim.keymap.set("n", "<leader>rf", ":TestFile<CR>")
    vim.keymap.set("n", "<leader>rs", ":TestSuite<CR>")
  end,
}
