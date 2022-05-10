-- 基础设置
require("basic")

-- 快捷键设置
require("keybindings")

-- 插件管理
require("plugins")

-- 主题设置
require("colorscheme")

-- 自动命令
require("autocmds")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.toggleterm")
require("plugin-config.nvim-cursorline")
require("plugin-config.hop")
require("plugin-config.neogen")
require("plugin-config.todo-comment")
require("plugin-config.nvim-notify")

-- 内置 LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.formatter")
require("lsp.ui")
