local jdtls_config = require("lsp.settings.jdtls").setup()
local jdtls = utils.loadpkg("jdtls")
if jdtls == nil then
    return
end
utils.notify("JDTLS started")
jdtls.start_or_attach(jdtls_config)
