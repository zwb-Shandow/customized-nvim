local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
  vim.notify("not found nvim-lsp-installer")
  return
end

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
}

-- 自动安装 Language Servers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
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
