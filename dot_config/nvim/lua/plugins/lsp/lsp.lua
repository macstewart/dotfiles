local _ = utils.loadpkg("lspconfig")
if _ == nil then
    return
end

require "plugins.lsp.mason"
require("plugins.lsp.handlers").setup()
require "plugins.lsp.null-ls"
require "plugins.lsp.go-nvim"
