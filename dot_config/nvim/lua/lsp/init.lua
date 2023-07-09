local _ = utils.loadpkg("lspconfig")
if _ == nil then
    return
end

require "lsp.mason"
require("lsp.handlers").setup()
require "lsp.null-ls"
require "lsp.go-nvim"
