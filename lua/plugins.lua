local packer = require('packer')
packer.startup({
  function(use)
    -- packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 主题
    use 'LunarVim/onedarker.nvim'
    -- 侧边栏
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
    -- 顶部标签页
    use({ 'akinsho/bufferline.nvim', requires = { 'kyandani42/nvim-web-devicons', 'moll/vim-bbye' }})
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
