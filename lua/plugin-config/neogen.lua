local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
	vim.notify("not found neogen")
	return
end

neogen.setup({})
