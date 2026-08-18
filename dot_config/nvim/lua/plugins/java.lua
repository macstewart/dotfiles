return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local jdtls = require("jdtls")
      local nvlsp = require("nvchad.configs.lspconfig")

      local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

      local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config_dir = jdtls_path .. "/config_mac_arm"
      local lombok_jar = jdtls_path .. "/lombok.jar"

      local jvm_args = {
        "/Library/Java/JavaVirtualMachines/ibm-semeru-open-25.jdk/Contents/Home/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ERROR",
        "-Dsun.zip.disableMemoryMapping=true",
        "-Xms256m",
        "-Xmx2G",
        "-XX:+UseParallelGC",
        "-XX:GCTimeRatio=4",
        "-XX:AdaptiveSizePolicyWeight=90",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      }

      -- without the agent, jdtls can't see lombok-generated members and every
      -- getter/setter/builder call resolves to nothing
      if vim.fn.filereadable(lombok_jar) == 1 then
        table.insert(jvm_args, "-javaagent:" .. lombok_jar)
      end

      local config = {
        cmd = vim.list_extend(jvm_args, {
          "-jar", launcher_jar,
          "-configuration", config_dir,
          "-data", workspace_dir,
        }),
        root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        on_attach = function(client, bufnr)
          nvlsp.on_attach(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          client.server_capabilities.signatureHelpProvider = nil
          client.server_capabilities.completionProvider = nil
          client.server_capabilities.documentHighlightProvider = false
          client.server_capabilities.codeLensProvider = nil
          client.server_capabilities.codeActionProvider = false
          client.server_capabilities.renameProvider = false
        end,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        settings = {
          java = {
            autobuild = { enabled = false },
            eclipse = { downloadSources = false },
            maven = { downloadSources = false },
            signatureHelp = { enabled = false },
            contentProvider = { preferred = "fernflower" },
            completion = { enabled = false },
            sources = {
              organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
            },
          },
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          jdtls.start_or_attach(config)
        end,
      })

      -- lazy loads this plugin *during* the FileType event, so the autocmd above
      -- misses the buffer that triggered the load
      if vim.bo.filetype == "java" then
        jdtls.start_or_attach(config)
      end
    end,
  },
}
