-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- 显示行号
vim.o.number = true

-- 允许光标出现在最后一个字符的后面
vim.o.virtualedit = "onemore"

-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 高亮所在行
vim.wo.cursorline = true
vim.wo.cursorcolumn = true

-- Tab = 2个空格
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写不敏感,除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索不要高亮
vim.o.hlsearch = true

-- 命令行高为2
vim.o.cmdheight = 2

-- 禁止折行
vim.wo.wrap = false

-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"

-- 鼠标支持
vim.o.mouse = "a"

-- 禁止创建备份文件
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller update time
vim.o.updatetime = 300

-- 设置 timeoutlen 为等待键盘快捷键连击时间500ms
vim.o.timeoutlen = 500

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu, menuone, noselect, noinsert"

-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- 不可见字符的显示
vim.o.list = true

-- 补全最多显示10行
vim.o.pumheight = 10

-- 永远显示 tabline
vim.o.showtabline = 2

-- 使用增强状态栏插件后,不再需要 vim 的模式提示
vim.o.showmode = false
