
module = {}

local function isLight(color)
    local _, _, l = color:hsla(color)
    return l > 0.5
end

module.isLight = isLight

return module

