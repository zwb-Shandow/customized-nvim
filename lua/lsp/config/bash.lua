local opts = {
	settings = nil,
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件处理
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		-- 保存时自动格式化
		-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.formatting_sync()")
	end,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
