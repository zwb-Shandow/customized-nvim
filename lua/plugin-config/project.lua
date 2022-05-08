local status, project = pcall(require, "project_nvim")
if not status then
	vim.notify("not found project_nvim")
	return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cmd = 1

project.setup({
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
})

local telescope = require("telescope")
pcall(telescope.load_extension, "projects")
