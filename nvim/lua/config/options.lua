-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = "\\" -- Default leader

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = "longest:full,full"

vim.opt.title = true

vim.opt.fillchars:append({ eob = " " }) -- remove ~ from end of buffer

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.spell = true

vim.opt.ignorecase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove(".")

vim.opt.showmode = false

vim.opt.signcolumn = "yes:2"
vim.opt.completeopt = "popup"
