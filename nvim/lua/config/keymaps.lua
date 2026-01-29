-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Oil
vim.keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Github open file
vim.keymap.set("n", "<leader>gr", ":OpenInGHRepo<CR>")
vim.keymap.set("n", "<leader>gf", ":OpenInGHFile<CR>")
vim.keymap.set("v", "<leader>gf", ":OpenInGHFileLines<CR>")

-- Format Json
vim.keymap.set("v", "<leader>j", ":%!jq .<CR>")

-- Wiki Sync
vim.keymap.set("n", "<leader>ws", function()
  local snacks = require("snacks")
  local wiki_path = vim.fn.expand("~/work/wiki")
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  local commit_msg = "Update wiki: " .. timestamp

  vim.fn.system(string.format("git -C %s add .", wiki_path))

  vim.fn.system(string.format("git -C %s commit -m '%s'", wiki_path, commit_msg))

  local push_result = vim.fn.system(string.format("git -C %s push origin main", wiki_path))

  snacks.notifier.notify(push_result, "info", {
    title = "Wiki sync",
  })
end, { desc = "Commit and push wiki changes" })

-- Commit temporal current project changes
vim.keymap.set("n", "<leader>gS", function()
  local snacks = require("snacks")
  local project_path = vim.fn.getcwd()
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  local commit_msg = "Temp changes: " .. timestamp

  vim.fn.system(string.format("git -C %s add .", project_path))

  local commit_result = vim.fn.system(string.format("git -C %s commit -m '%s'", project_path, commit_msg))

  snacks.notifier.notify(commit_result, "info", {
    title = "Temporal commit done",
  })
end, { desc = "Commit temporal current project changes" })
