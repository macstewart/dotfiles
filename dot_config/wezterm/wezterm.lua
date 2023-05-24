require("style")
-- require("nvimPanes")
require("wezmap")
-- require("handlers")

local config = {
    window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 0,
    },
    tab_max_width = 2000,
    -- window_background_opacity = 0.99,
    window_decorations = "RESIZE",
    -- enable_tab_bar = true,
    scrollback_lines = 5000,
    enable_scroll_bar = false,
    check_for_updates = true,
    adjust_window_size_when_changing_font_size = false,
    -- hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    enable_tab_bar = false,
    audible_bell = "Disabled",
}

local function addConfig(moduleConfig)
    for i, v in pairs(moduleConfig) do
        config[i] = v
    end
end

addConfig(StyleConfig)
addConfig(KeyConfig)
return config
