local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. project_name

local config = {
  cmd = {
    home .. "/.jvm/zulu21/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    home .. "/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.1000.v20250227-1734.jar",
    "-configuration",
    home .. "/jdt-language-server/config_linux",
    "-data",
    workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = home .. "/.jvm/zulu8",
            default = true,
          },
        },
      },
    },
  },
  init_options = {
    bundles = {
      vim.fn.glob(
        home .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
        1
      ),
    },
  },
}
require("jdtls").start_or_attach(config)
