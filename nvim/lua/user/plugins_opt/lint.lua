require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "eslint_d", "prettier" },
		javascriptreact = { "eslint_d", "prettier" },
		typescript = { "eslint_d", "prettier" },
		typescriptreact = { "eslint_d", "prettier" },
		vue = { "eslint_d", "prettier" },
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
		kotlin = { "ktfmt" },
		java = { "google-java-format" },
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
