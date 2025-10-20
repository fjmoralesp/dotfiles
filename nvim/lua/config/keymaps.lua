-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Oil
vim.keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Github open file
vim.keymap.set("n", "<leader>gr", ":OpenInGHRepo<CR>")
vim.keymap.set("n", "<leader>gf", ":OpenInGHFile<CR>")
vim.keymap.set("v", "<leader>gf", ":OpenInGHFileLines<CR>")

-- Telescope
-- vim.keymap.set("n", "<leader>tF", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
-- vim.keymap.set("n", "<leader>tb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
-- vim.keymap.set("n", "<leader>tf", [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<CR>]])
-- vim.keymap.set("n", "<leader>tD", ":Telescope diagnostics<CR>")
-- vim.keymap.set("n", "<leader>th", require("telescope").extensions.picker_list.picker_list)
-- vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>")
