local status, toggleterm = pcall(require, "toggleterm")
if not status then
	vim.notify("not found toggleterm")
	return
end

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = 20,
	open_mapping = [[<C-\>]],
	shade_terminals = true,
	-- 开启的终端默认进入插入模式
	start_in_insert = true,
	close_on_exit = true,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	hidden = true,
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
	end,
	on_close = function(term)
		vim.cmd("close terminal")
	end,
})

function _lazygit_toggle()
	lazygit:toggle()
end
