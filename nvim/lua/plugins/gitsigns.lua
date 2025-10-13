return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({ current_line_blame = true })
    vim.keymap.set("n", "m", ":Gitsigns next_hunk<CR>")
    vim.keymap.set("n", "M", ":Gitsigns prev_hunk<CR>")
    vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
    vim.keymap.set("n", "gR", ":Gitsigns reset_hunk<CR>")
  end,
}
