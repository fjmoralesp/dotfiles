local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		path_display = { truncate = 1 },
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<A-Down>"] = actions.cycle_history_next,
				["<A-Up>"] = actions.cycle_history_prev,
			},
		},
		file_ignore_patterns = { ".git/", "bin/", "dist/", "build/" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		oldfiles = {
			prompt_title = "History",
		},
	},
})

require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("import")
require("telescope").load_extension("project")

-- picker_list must be the last one
require("telescope").load_extension("picker_list")

vim.keymap.set("n", "<leader>tF", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set("n", "<leader>tb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set("n", "<leader>tf", [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<CR>]])
vim.keymap.set("n", "<leader>tD", ":Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>th", require("telescope").extensions.picker_list.picker_list)
vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>ti", ":Telescope import<CR>")
vim.keymap.set(
	"n",
	"<leader>tp",
	[[<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>]]
)
