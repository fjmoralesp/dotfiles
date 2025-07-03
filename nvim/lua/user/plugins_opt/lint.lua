require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		vue = { "eslint_d" },
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
