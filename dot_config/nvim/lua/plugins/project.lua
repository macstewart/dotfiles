local project = utils.loadpkg("project_nvim")
if project == nil then
    return
end
project.setup({

	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },

	-- patterns used to detect root dir, when **"pattern"** is in detection_methods
	patterns = { ".git", "Makefile", "package.json", "go.mod" },
})

local telescope = utils.loadpkg("telescope")
if telescope == nil then
    return
end

telescope.load_extension('projects')
