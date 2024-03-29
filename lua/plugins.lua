-- 自动安装 Packer.nvim
-- 安装目录: ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("Packer.nvim is installing, please wait...")
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("Packer.nvim install success!")
end

local status, packer = pcall(require, "packer")
if not status then
	vim.notify("not found packer.nvim")
	return
end

packer.startup({
	function(use)
		-- packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 主题
		use("LunarVim/onedarker.nvim")
		-- 侧边栏
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- 顶部标签页
		use({ "akinsho/bufferline.nvim", requires = { "kyandani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- 底部信息显示栏
		use({ "nvim-lualine/lualine.nvim", requires = { "kyandani42/nvim-web-devicons" } })
		-- 底部显示栏扩展
		use("arkav/lualine-lsp-progress")
		-- 模糊搜索
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- 启动页与项目列表
		use("glepnir/dashboard-nvim")
		-- 模糊搜索扩展
		use("ahmedkhalf/project.nvim")
		-- 语法高亮
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- 彩虹括号
		use("p00f/nvim-ts-rainbow")
		-- 管理 Language server
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		-- 括号补全
		use("windwp/nvim-autopairs")
		-- 代码注释
		use("numToStr/Comment.nvim")
		-- 代码格式化
		use("mhartington/formatter.nvim")
		-- 符号列表
		use("simrat39/symbols-outline.nvim")
		-- 终端
		use({ "akinsho/toggleterm.nvim", tag = "V1.*" })
		-- ui
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")
		-- 单词高亮
		use("yamatsum/nvim-cursorline")
		-- 快速跳转
		use({ "phaazon/hop.nvim", branch = "v1" })
		-- 多语言注释工具
		use({ "zwb-Shandow/neogen", requires = "nvim-treesitter/nvim-treesitter" })
		-- todo 高亮
		use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
		-- 通知管理器
		use("rcarriga/nvim-notify")

		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			default_url_format = "git@github.com:%s",
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
