local lsp_installer = require("utils").requirePlugin("nvim-lsp-installer.servers")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	sumneko_lua = require("lsp.config.lua"),
	clangd = require("lsp.config.c++"),
	cmake = require("lsp.config.cmake"),
	jedi_language_server = require("lsp.config.python"),
	dockerls = require("lsp.config.docker"),
	jsonls = require("lsp.config.json"),
	prosemd_lsp = require("lsp.config.markdown"),
	vimls = require("lsp.config.vim"),
	yamlls = require("lsp.config.yaml"),
	bashls = require("lsp.config.bash"),
}

-- 自动安装 Language Servers
for name, _ in pairs(servers) do
	local server_available, requested_server = lsp_installer.get_server(name)
	local install_notfication = false
	if server_available then
		if not requested_server:is_installed() then
			vim.notify(string.format("Installing server: [%s]", name))
			requested_server:install()
			install_notfication = true
		end
	end

	requested_server:on_ready(function(server)
		if install_notfication then
			vim.notify(string.format("Installation complete for [%s] server", server.name))
		end
		install_notfication = false
		local config = servers[server.name]
		if config == nil then
			return
		end
		if config.on_setup then
			config.on_setup(server)
		else
			server:setup({})
		end
	end)
end
