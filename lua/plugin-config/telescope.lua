local telescope = require("utils").requirePlugin("telescope")

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为insert
		initial_mode = "insert",
		-- 窗口内快捷键
		mappings = require("keybindings").telescopeList,
	},
	pickers = {
		-- 内置pickers配置
		find_files = {
			-- 查找文件换皮肤，支持的参数有: dropdown, cursor, ivy
			-- theme = "dropdown",
		},
	},
	extensions = {
		-- 扩展插件配置
	},
})

pcall(telescope.load_extension, "notify")
