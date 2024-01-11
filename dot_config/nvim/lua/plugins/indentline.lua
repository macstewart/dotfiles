local indent_blankline = utils.loadpkg("ibl")
if indent_blankline == nil then
	return
end

indent_blankline.setup({
	indent = {
		char = "▏",
	},
	exclude = {
		filetypes = {
			"help",
			"packer",
			"NvimTree",
		},
		buftypes = {
			"terminal",
			"nofile",
		},
	},
})
