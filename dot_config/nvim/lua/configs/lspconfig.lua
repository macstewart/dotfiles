require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "sqlls" }

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
