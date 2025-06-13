require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		kotlin = { "ktfmt" },
		java = { "google-java-format" },
		bash = { "beautysh" },
		markdown = { "mdformat" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("mason-conform").setup()
