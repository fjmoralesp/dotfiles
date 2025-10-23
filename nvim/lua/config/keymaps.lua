-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Oil
vim.keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Github open file
vim.keymap.set("n", "<leader>gr", ":OpenInGHRepo<CR>")
vim.keymap.set("n", "<leader>gf", ":OpenInGHFile<CR>")
vim.keymap.set("v", "<leader>gf", ":OpenInGHFileLines<CR>")

-- Code Companion
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
