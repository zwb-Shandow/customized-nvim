local M = {}

function M.requirePlugin(name)
	local status_ok, plugin = pcall(require, name)
	if not status_ok then
		vim.notify("not found plugin:" .. name)
		return nil
	end
	return plugin
end

return M
