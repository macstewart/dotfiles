-- local class = require("30log")
local wezterm = require("wezterm")
local text_util = require("util/text")
local arrow_solid_r = ""
local arrow_thin_r = ""
local arrow_solid_l = ""
local arrow_thin_l = ""

-- Segment = class("Segment")
Segment = {}
Segment.textColor = "#000000"
Segment.backgroundColor = "#FFFFFF"
Segment.text = "Hello, world!"
Segment.minWidth = 0
Segment.maxWidth = 999
Segment.prefix = ""
Segment.suffix = ""

function Segment:new(colors, text)
	local o = { backgroundColor = colors.bg, textColor = colors.fg, text = text }
	setmetatable(o, self)
	self.__index = self
	return o
end

function Segment:withMax(max)
	self.maxWidth = max
	return self
end

function Segment:withPrefix(pre)
	self.prefix = pre
	return self
end

function Segment:withSuffix(post)
	self.suffix = post
	return self
end

function Segment:withMin(min)
	self.minWidth = min
	return self
end

function Segment:withFixedSize(size)
	self.minWidth = size
	self.maxWidth = size
	return self
end

function Segment:formatText()
    local prefix_len, suffix_len = wezterm.column_width(self.prefix), wezterm.column_width(self.suffix)
	self.text = text_util.pad_center(self.text, self.minWidth)
    self.text = wezterm.truncate_left(self.text, wezterm.column_width(self.text) - prefix_len)
    self.text = wezterm.truncate_right(self.text, wezterm.column_width(self.text) - suffix_len)
    if self.prefix ~= nil then
        self.text = self.prefix .. self.text
    end
    if self.suffix ~= nil then
        self.text = self.text .. self.suffix
    end
end



function Segment:append(last_bg, bar)
	if bar == nil then
		bar = {}
	end
	if self.minWidth == 0 and self.text == nil or wezterm.column_width(self.text) < 0 then
		return nil
	end
    self:formatText()
	if last_bg ~= nil then
		table.insert(bar, { Background = { Color = last_bg } })
	end
	if last_bg == self.backgroundColor then
		table.insert(bar, { Foreground = { Color = self.textColor } })
		table.insert(bar, { Text = arrow_thin_r })
	else
		table.insert(bar, { Foreground = { Color = self.backgroundColor } })
		table.insert(bar, { Text = arrow_solid_r })
	end
	table.insert(bar, { Background = { Color = self.backgroundColor } })
	table.insert(bar, { Foreground = { Color = self.textColor } })
	table.insert(bar, { Text = self.text })
	return bar
end

function Segment:appendLeft(next_bg, bar)
	if bar == nil then
		bar = {}
	end
	if self.minWidth == 0 and self.text == nil or wezterm.column_width(self.text) < 0 then
		return nil
	end
    self:formatText()
	table.insert(bar, { Background = { Color = self.backgroundColor } })
	table.insert(bar, { Foreground = { Color = self.textColor } })
	table.insert(bar, { Text = self.text })
	if next_bg ~= nil then
		table.insert(bar, { Background = { Color = next_bg } })
		if next_bg == self.backgroundColor then
			table.insert(bar, { Foreground = { Color = self.textColor } })
			table.insert(bar, { Text = arrow_thin_l })
		else
			table.insert(bar, { Foreground = { Color = self.backgroundColor } })
			table.insert(bar, { Text = arrow_solid_l })
		end
	else
		table.insert(bar, { Background = { Color = "rgba(50%, 50%, 50%, 0%)" } })
		table.insert(bar, { Foreground = { Color = self.backgroundColor } })
		table.insert(bar, { Text = arrow_solid_l })
	end
	return bar
end
