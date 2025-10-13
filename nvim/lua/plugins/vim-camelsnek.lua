return {
  "nicwest/vim-camelsnek",
  config = function()
    vim.keymap.set("v", "gss", ":Snek<CR>")
    vim.keymap.set("v", "gsC", ":Camel<CR>")
    vim.keymap.set("v", "gsc", ":CamelB<CR>")
    vim.keymap.set("v", "gsk", ":Kebab<CR>")
    vim.keymap.set("v", "gsS", ":Screm<CR>")
  end,
}
