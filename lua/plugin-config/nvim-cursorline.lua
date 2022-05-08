local status_ok, cursor = pcall(require, "nvim-cursorline")
if not status_ok then
	vim.notify("not found nvim-cursorline")
	return
end

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
