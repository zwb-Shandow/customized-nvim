local project = require("utils").requirePlugin("project_nvim")

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cmd = 1

project.setup({
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
})

local telescope = require("telescope")
pcall(telescope.load_extension, "projects")
