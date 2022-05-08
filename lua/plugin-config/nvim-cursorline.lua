local cursor = require("utils").requirePlugin("nvim-cursorline")

cursor.setup({
	cursorline = {
		enable = true,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		h1 = { underline = true },
	},
})
