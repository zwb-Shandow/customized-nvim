local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	vim.notify("not found todo-comments")
	return
end

todo.setup({})
