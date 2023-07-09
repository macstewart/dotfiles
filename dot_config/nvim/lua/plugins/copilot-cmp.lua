local copilotCmp = utils.loadpkg("copilot_cmp")
if copilotCmp == nil then
    return
end

copilotCmp.setup({
    method = "getCompletionsCycling",
    formatters = {
        label = require("copilot_cmp.format").format_label_text,
        insert_text = require("copilot_cmp.format").format_insert_text,
        preview = require("copilot_cmp.format").deindent,
    },
})
