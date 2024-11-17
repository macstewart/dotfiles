local _ = utils.loadpkg("lspconfig")
if _ == nil then
    return
end

require("lsp.mason")
require("lsp.handlers").setup()
require("lsp.null-ls")
require("lsp.go-nvim")

local _M = {}

function _M.get_common_options()
    return {
        on_attach = _M.common_on_attach,
        capabilities = _M.common_capabilities(),
    }
end

return _M

