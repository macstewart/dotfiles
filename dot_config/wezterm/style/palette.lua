local color = require("wezterm").color
local color_utils = require("util/color")
local catpuccin = require("style/palettes/catpuccin")

local function wrapIndex(i, max)
	i = i % max
	if i == 0 then
		i = max
	end
	return i
end

local kanagawa = {
	foreground = "#dcd7ba",
	background = "#1f1f28",

	cursor_bg = "#1f1f28",
	cursor_fg = "#1f1f28",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

-- palette
Palette = {}
Palette.lights = { color.parse("#FFFFFF") }
Palette.darks = { color.parse("#000000") }
Palette.backgrounds = color.get_default_colors()

function Palette:bgGradient(light, dark, bgs)
	local o = self:new({ light }, { dark }, bgs)
	setmetatable(o, self)
	self.__index = self
	return o
end

function Palette:new(lightFgs, darkFgs, bgs)
	local o = { lights = lightFgs, darks = darkFgs, backgrounds = bgs }
	setmetatable(o, self)
	self.__index = self
	return o
end

local palettes = {
	rainbow = Palette:bgGradient(
		color.parse("#dcd7ba"),
		color.parse("#54546D"),
		color.gradient({ preset = "Rainbow" }, 5)
	),
	viridis = Palette:bgGradient(
		color.parse("#dcd7ba"),
		color.parse("#16161D"),
		color.gradient({ preset = "Viridis" }, 6)
	),
	warm = Palette:bgGradient(color.parse("#dcd7ba"), color.parse("#54546D"), color.gradient({ preset = "Warm" }, 6)),
	cividis = Palette:bgGradient(
		color.parse("#dcd7ba"),
		color.parse("#363646"),
		color.gradient({ preset = "Cividis" }, 6)
	),
	custom1 = Palette:bgGradient(
		color.parse("#dcd7ba"),
		color.parse("#363646"),
		color.gradient({ colors = { "#EEBD89", "#D13ABD" } }, 3)
	),
	custom2 = Palette:bgGradient(
		color.parse("#dcd7ba"),
		color.parse("#363646"),
		color.gradient({ colors = { "#7e9cd8", "#c8c093" } }, 2)
	),
	kanagawa = Palette:bgGradient(
		color.parse("#dcd7ba"),
		color.parse("#1f1f28"),
		color.gradient({ colors = { "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" } }, 10)
	),
	catpuccin_mocha_blue = Palette:bgGradient(
		color.parse(catpuccin.mocha.blue),
		color.parse(catpuccin.mocha.surface0),
		color.gradient({ colors = {
			catpuccin.mocha.surface1,
			catpuccin.mocha.blue,
		} }, 2)
	),
	catpuccin_mocha_green = Palette:bgGradient(
		color.parse(catpuccin.mocha.green),
		color.parse(catpuccin.mocha.surface0),
		color.gradient({ colors = {
			catpuccin.mocha.green,
			catpuccin.mocha.surface1,
		} }, 2)
	),
}

function Palette:choose_fg(i, bg)
	if color_utils.isLight(bg) then
		return self.darks[wrapIndex(i, #self.darks)]
	else
		return self.lights[wrapIndex(i, #self.lights)]
	end
end

function Palette:pair(i)
	local bg = self.backgrounds[wrapIndex(i, #self.backgrounds)]
	return { fg = self:choose_fg(i, bg), bg = bg }
end

return palettes
