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
		markdown = { "markdownlint" },
		graphql = { "prettier" },
		handlebars = { "prettier" },
		bash = { "beautysh" },
		kotlin = { "ktfmt" },
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
	},
	format_on_save = {
		lsp_format = "fallback",
		async = true,
	},
})

require("mason-conform").setup()

-- Keymaps
vim.keymap.set("n", "gl", [[<cmd>lua require("conform").format({ async = true })<CR>]])
