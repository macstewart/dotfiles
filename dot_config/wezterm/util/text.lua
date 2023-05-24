local wezterm = require("wezterm")
module = {}

local function pad_center(str, max)
    if str ~= nil and wezterm.column_width(str) < max then
        local pad = max - wezterm.column_width(str)
        local pad_left = math.floor(pad / 2)
        local pad_right = pad - pad_left
        str = string.rep(" ", pad_left) .. str .. string.rep(" ", pad_right)
    end
    return str
end
module.pad_center = pad_center

return module
