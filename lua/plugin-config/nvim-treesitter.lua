local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("not found nvim-treesitter")
	return
end

treesitter.setup({
	-- 安装 language parser
	-- :TSInstallInfo 命令查看支持的语言
	ensure_installed = {
		"json",
		"vim",
		"lua",
		"cpp",
		"python",
		"dockerfile",
		"cmake",
		"make",
		"markdown",
		"yaml",
		"proto",
	},
	-- 启用代码高亮模块
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- 启用增量选择模块
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- 启用代码缩进模块 (=)
	indent = {
		enable = true,
	},
	-- 启用彩虹括号
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		-- setting colors
		colors = {
			"#00ffff",
			"#ffff00",
			"#66ff33",
			"#ff66ff",
			"#ffffff",
			"#ff99cc",
			"#43CD80",
		},
		-- term colors
		termcolors = {
			"Blue",
			"Yellow",
			"Cyan",
			"Magenta",
			"White",
			"Red",
			"Green",
		},
	},
})

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
