-- Clear search highlighting.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move text up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Format Json
vim.keymap.set('v', '<leader>j', ':%!jq .<CR>')

-- Move to next or previous {char}
vim.keymap.set('n', '](', '<cmd>normal! f(<CR>')
vim.keymap.set('n', '[(', '<cmd>normal! F(<CR>')
vim.keymap.set('n', '])', '<cmd>normal! f)<CR>')
vim.keymap.set('n', '[)', '<cmd>normal! F)<CR>')
vim.keymap.set('n', ']{', '<cmd>normal! f{<CR>')
vim.keymap.set('n', '[{', '<cmd>normal! F{<CR>')
vim.keymap.set('n', ']}', '<cmd>normal! f}<CR>')
vim.keymap.set('n', '[}', '<cmd>normal! F}<CR>')
