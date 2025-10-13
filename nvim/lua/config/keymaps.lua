-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Clear search highlighting.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Format Json
vim.keymap.set("v", "<leader>j", ":%!jq .<CR>")

-- Move to next or previous {char}
vim.keymap.set("n", "](", "<cmd>normal! f(<CR>")
vim.keymap.set("n", "[(", "<cmd>normal! F(<CR>")
vim.keymap.set("n", "])", "<cmd>normal! f)<CR>")
vim.keymap.set("n", "[)", "<cmd>normal! F)<CR>")
vim.keymap.set("n", "]{", "<cmd>normal! f{<CR>")
vim.keymap.set("n", "[{", "<cmd>normal! F{<CR>")
vim.keymap.set("n", "]}", "<cmd>normal! f}<CR>")
vim.keymap.set("n", "[}", "<cmd>normal! F}<CR>")

-- CodeCompanion
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

-- Oil
vim.keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- for repository page
vim.keymap.set("n", "<leader>gr", ":OpenInGHRepo<CR>")

-- for current file page
vim.keymap.set("n", "<leader>gf", ":OpenInGHFile<CR>")
vim.keymap.set("v", "<leader>gf", ":OpenInGHFileLines<CR>")

-- Telescope
vim.keymap.set("n", "<leader>tF", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set("n", "<leader>tb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set("n", "<leader>tf", [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<CR>]])
vim.keymap.set("n", "<leader>tD", ":Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>th", require("telescope").extensions.picker_list.picker_list)
vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>")
