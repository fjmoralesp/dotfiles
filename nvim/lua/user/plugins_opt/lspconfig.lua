require("mason").setup()
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Kotlin
local root_files = {
	"settings.gradle", -- Gradle (multi-project)
	"settings.gradle.kts", -- Gradle (multi-project)
	"build.xml", -- Ant
	"pom.xml", -- Maven
	"build.gradle", -- Gradle
	"build.gradle.kts", -- Gradle
}
vim.lsp.config("kotlin_language_server", {
	filetypes = { "kotlin" },
	root_markers = root_files,
	cmd = { "kotlin-language-server" },
	init_options = {
		storagePath = os.getenv("HOME") .. "/.cache",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config("*", { capabilities = capabilities })

require("mason-lspconfig").setup({
	ensure_installed = {
		-- Json
		"jsonls",

		-- Lua
		"lua_ls",

		-- Typescript, Javascript
		"vtsls",

		-- Python
		"pyright",

		-- Kotlin
		"kotlin_language_server",
	},
})

-- Keymaps
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")

-- LSP sign configuration
vim.diagnostic.config({
	virtual_text = false,
	float = {
		source = true,
	},
	underline = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})
