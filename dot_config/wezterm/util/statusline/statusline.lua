local wezterm = require("wezterm")
local palettes = require("style/palette")
local mux = require("util/mux")

module = {}

local bars = {
	date = function()
		return wezterm.strftime(" %I:%M %p ")
	end,
	cwd = function(p)
		local cwd = ""
		if p ~= nil and p:get_current_working_dir() ~= nil then
			cwd = p:get_current_working_dir():sub(8) .. " "
			if cwd:find(wezterm.home_dir) then
				cwd = "~" .. cwd:sub(#wezterm.home_dir + 1)
			end
		end
		return cwd
	end,
}

local function renderBarRight(segments)
	local elements = {}
	local last_bg = nil
	for _, segment in ipairs(segments) do
		segment:append(last_bg, elements)
		last_bg = segment.backgroundColor
	end
	return elements
end

local function renderBarLeft(segments)
	local elements = {}
	local last_bg = nil
	for _, segment in ipairs(segments) do
		segment:appendLeft(last_bg, elements)
		last_bg = segment.backgroundColor
	end
	return elements
end

local function buildRight(w, p)
	local palette = palettes.catpuccin_mocha_green
	local date_bar = bars.date()
	local key_table = w:active_key_table()
	if key_table == nil then
		key_table = ""
		palette = palettes.catpuccin_mocha_blue
	end
	local segments = {
		Segment:new(palette:pair(4), key_table):withFixedSize(9),
		Segment:new(palette:pair(5), date_bar),
	}
	return renderBarRight(segments)
end

local function buildLeft(w, p)
	local palette = palettes.viridis
	local pane_info = mux.extract_pane_info(p)
	local is_zoomed = pane_info ~= nil and pane_info.is_zoomed or false
	local zoom_state = is_zoomed and "Z" or " "
	local segments = {
		Segment:new(palette:pair(3), zoom_state):withFixedSize(10),
	}
	return renderBarLeft(segments)
end

local tab_colors = {
	normal = {
		active = {
            fg = palettes.catpuccin_mocha_blue:pair(1).bg,
            bg = palettes.catpuccin_mocha_blue:pair(1).fg
        },
		inactive = {
            fg = palettes.catpuccin_mocha_blue:pair(1).fg,
            bg = palettes.catpuccin_mocha_blue:pair(1).bg
        },
	},
	command = {
		active = {
            fg = palettes.catpuccin_mocha_blue:pair(1).bg,
        },
		inactive = {
            fg = palettes.kanagawa:pair(6).bg,
            bg = palettes.cividis:pair(1).bg
        },
	},
}

local icons = {
    panes = "󰀿",
    nvim = "",
    terminal = "",
}


local function buildTitle(tab, tabs)
    local title = tab.active_pane.title
    if title == "v" then
        return icons.nvim .. " nvim"
    end
    return title
end

local function buildActiveTab(tab, tabs)
	local title = buildTitle(tab, tabs)
    local is_zoomed = tab.active_pane.is_zoomed
    if is_zoomed then
        title = icons.panes .. " " .. title
    end
    
	local is_last = tab.tab_index + 1 >= #tabs
	local next_color = nil
	if not is_last then
		next_color = tab_colors.normal.inactive.bg
	end
	local seg = Segment:new(tab_colors.normal.active, title):withMin(15)
	return seg:appendLeft(next_color)
end

local function buildInactiveTab(tab, tabs)
	local title = buildTitle(tab, tabs)
	local is_last = tab.tab_index + 1 >= #tabs
	local active_index = mux.active_tab_index(tabs)
	local next_color = tab_colors.normal.inactive.bg
	if is_last then
		next_color = nil
	elseif tab.tab_index + 2 == active_index then
		next_color = tab_colors.normal.active.bg
	end
	local seg = Segment:new(tab_colors.normal.inactive, title):withMin(15):withSuffix(tab.tab_index + 1)
	return seg:appendLeft(next_color)
end

module.buildRight = buildRight
module.buildLeft = buildLeft
module.buildActiveTab = buildActiveTab
module.buildInactiveTab = buildInactiveTab

return module
