require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		scss = { "prettier" },
		less = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		handlebars = { "prettier" },
		kotlin = { "ktlint", "ktfmt" },
		bash = { "beautysh" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("mason-conform").setup()

-- Keymaps
vim.keymap.set("n", "gl", [[<cmd>lua require("conform").format({ async = true })<CR>]])
