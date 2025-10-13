return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jsonls = {},
      vtsls = {},
      pyright = {},
      kotlin_language_server = {
        filetypes = { "kotlin" },
        root_markers = {
          "settings.gradle", -- Gradle (multi-project)
          "settings.gradle.kts", -- Gradle (multi-project)
          "build.xml", -- Ant
          "pom.xml", -- Maven
          "build.gradle", -- Gradle
          "build.gradle.kts", -- Gradle
        },
        cmd = { "kotlin-language-server" },
        init_options = {
          storagePath = os.getenv("HOME") .. "/.cache",
        },
      },
    },
  },
}
