local packer = require('packer')
packer.startup({
  function(use)
    -- packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 主题
    use 'LunarVim/onedarker.nvim'
    -- 侧边栏
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    -- 顶部标签页
    use { 'akinsho/bufferline.nvim', requires = { 'kyandani42/nvim-web-devicons', 'moll/vim-bbye' }}
    -- 底部信息显示栏
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyandani42/nvim-web-devicons' }}
    -- 底部显示栏扩展
    use 'arkav/lualine-lsp-progress'
    -- 模糊搜索
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }}
    -- 启动页与项目列表
    use 'glepnir/dashboard-nvim'
    -- 模糊搜索扩展
    use 'ahmedkhalf/project.nvim'
    -- 语法高亮
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- 彩虹括号
    use 'p00f/nvim-ts-rainbow'
    -- 管理 Language server
    use { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' }
    -- 补全引擎
    use 'hrsh7th/nvim-cmp'
    -- snippet 引擎
    use 'hrsh7th/vim-vsnip'
    -- 补全源
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- 常见编程语言代码段
    use 'rafamadriz/friendly-snippets'
    -- 括号补全
    use 'windwp/nvim-autopairs'
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
