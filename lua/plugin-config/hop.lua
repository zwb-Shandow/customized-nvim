local status_ok, hop = pcall(require, "hop")
if not status_ok then
	vim.notify("not found hop")
	return
end

hop.setup({})
