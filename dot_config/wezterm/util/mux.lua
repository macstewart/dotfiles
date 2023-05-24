local wezterm = require("wezterm")
module = {}
-- find the paneinformation in the table by pane id
local function extract_pane_info(pane)
	if pane == nil then
		return nil
	end
	local tab = pane:tab()
	if tab == nil then
		return nil
	end
    local panes = tab:panes_with_info()
    if panes == nil then
        return nil
    end
	for _, p in ipairs(panes) do
        if p.pane:pane_id() == pane:pane_id() then
            return p
        end
	end
	return nil
end

local function active_tab_index(tabs)
    for i, tab in ipairs(tabs) do
        if tab.is_active then
            return i
        end
    end
end

module.extract_pane_info = extract_pane_info
module.active_tab_index = active_tab_index

return module
