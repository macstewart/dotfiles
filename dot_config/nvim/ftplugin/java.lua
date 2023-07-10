local jdtls_config = require("lsp.settings.jdtls").setup()
local jdtls = utils.loadpkg("jdtls")
if jdtls == nil then
    return
end
-- utils.notify("jdtls_config: " .. vim.inspect(jdtls_config))
jdtls.start_or_attach(jdtls_config)
