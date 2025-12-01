return {
  "michaelPotter/accordian.nvim",
  lazy = false,
  config = function()
    require("accordian").setup()
    vim.keymap.set("n", "<leader>wz", ":Accordian<CR>")
  end,
}
