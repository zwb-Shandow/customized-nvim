# customized-nvim
Build customized nvim IDE with lua

## 0. Neovim 新特性

查看`:help nvim-features`完整列表!

## 1. Neovim 编译安装

### 1.1 安装 Neovim

- 源码编译

```shell
// 由于 v0.7.0 与 ubuntu18.04 gnome-terminal 不匹配, 退出时出现 [>4;0m 字符，固选用 v0.8.0
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
nvim
```

- apt 安装

```shell
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

[注] 若系统提示找不到 `add-apt-repository` 命令, 需先执行如下命令:

```shell
sudo apt-get install software-properties-common
```

### 1.2 依赖安装

进入 `nvim` 执行 `:checkhealth` 可查看缺失依赖,例如需求 `python>3.6`版本.

`python3.8` 的安装:

```shell
sudo apt-get update
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.8
python3.8 -m pip install neovim
```

### 1.3 配置文件路径

- 兼容 `vim` 配置

> 使用 `~/.config/nvim/init.vim` 替代 `.vimrc` 记录配置.
>
> 使用 `~/.config/nvim/` 替代 `.vim` 存储配置文件.

- 兼容 `lua` 配置

> 使用 `~/.config/nvim/init.lua` 存储配置信息
>
> 使用 `~/.config/nvim/` 存储配置文件

### 1.4 插件管理器

目前在 Neovim 最常见的插件管理器主要有 `vim-plug` 和 `packer.nvim` 两个.

`Packer.nvim` 相较于 `vim-plug` 功能更为强大，支持插件间的依赖，指定 commit 版本，Post-install/update hooks，指定分支等功能，使用全 lua 编写，是专门针对最新 Neovim v0.5.0 以上版本设计的，所以推荐使用。

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 2. 快捷键

### 2.1 基础快捷键(与插件无关)

| 快捷键                                          | 说明                                |
| :---------------------------------------------- | :---------------------------------- |
| `,`                                             | Leader Key                          |
| `sv`/`sh`/`sc`/`so`                             | 右侧分屏/下侧分屏/关闭当前/关闭其他 |
| `<C-h>`/`<C-j>`/`<C-k>`/`<C-l>`                 | 窗口/terminal 跳转                  |
| `<C-Left>`/`<C-Right>`/`<C-Up>`/`<C-Down>`/`s=` | 窗口比例控制                        |
| `<leader>t`/`<leader>vt`                        | terminal 切分                       |
| `<`/`>`                                         | visual 模式下代码缩进               |
| `J`/`K`                                         | 上下移动选中文本                    |
| `<C-u>`/`<C-d>`                                 | 上移9行/下移9行                     |
| `q`/`qq`/`Q`                                    | 退出(均不保存)                      |
| `<leader><leader>y`/`<leader><leader>p`         | 复制到系统剪切板/从系统剪切板粘贴   |

### 2.2 插件快捷键

- **侧边栏插件(nvim-tree)**

| 快捷键                      | 说明                                            |
| --------------------------- | ----------------------------------------------- |
| `<A-m>`                     | 打开/隐藏侧边栏                                 |
| `a`/`d`/`r`/`x`/`c`/`p`/`s` | create/remove/rename/cut/copy/paste/system_open |
| `<C-v>`/`<C-x>`/`<C-t>`     | vsplit/split/open_in_newtab                     |
| `g?`                        | nvim-tree 快捷键帮助                            |

当前使用 `nvim-tree.lua` 插件的默认配置, 若需自定义配置, 请在 `lua/keybindings.lua` 中添加.

```lua
pluginKeys.nvimTree = {
    -- 自定义 nvim-tree 快捷键
}
```

- **标签页插件(bufferline)**

| 快捷键                                 | 说明                      |
| -------------------------------------- | ------------------------- |
| `<A-j>`/`<A-k>`                        | 跳转至左侧/右侧 buffer    |
| `<C-w>`                                | 关闭当前 buffer           |
| `<leader>bl`/`<leader>bh`/`<leader>bc` | 关闭右侧/左侧/当前 buffer |

- **模糊搜索插件(telescope)**

| 快捷键                   | 说明               |
| ------------------------ | ------------------ |
| `<C-p>`                  | 查找文件           |
| `<C-f>`                  | 全局搜索           |
| `<leader>f`              | 当前 buffer 内搜索 |
| `<leader>p`              | 展示 projects      |
| `<C-b>`                  | 展示 buffers       |
| `<C-j>`/`<C-k>`          | 上下移动           |
| `<C-/>`                  | 快捷键展示         |
| `<C-c>`                  | 关闭搜索窗         |
| `:Telescope git_*`       | git 相关           |
| `:Telescope commands`    | 展示可用命令       |
| `:Telescope man_pages`   | 展示帮助文档       |
| `:Telescope colorscheme` | 展示主题           |

- 代码高亮(nvim-treesitter)

| 快捷键    | 说明                    |
| --------- | ----------------------- |
| `<CR>`    | 扩展选中代码片段        |
| `<BS>`    | 回退选中片段            |
| `TAB`     | 扩展选中代码片段(scope) |
| `zc`/`zo` | 代码折叠/打开           |

- 代码跳转(neovim内置lsp)

| 快捷键              | 说明                           |
| ------------------- | ------------------------------ |
| `<leader>rn`        | 变量重命名                     |
| `<leader>rn`        | code action                    |
| `gd`/`gD`/`gr`/`gi` | 跳转至定义/声明/引用/接口实现  |
| `gh`                | 展示函数说明                   |
| `F2`                | 代码格式化, 目前支持c++/python |

- 代码补全(nvim-cmp)

| 快捷键          | 说明                    |
| --------------- | ----------------------- |
| `<Tab>`/`<C-k>` | 补全框跳转下一个/上一个 |
| `<A-.>`/`<A-,>` | 出现/取消补全框         |
| `<C-u>`/`<C-d>` | 补全框上下滚动          |

- 代码注释(comment)

| 快捷键 | 说明   |
| ------ | ------ |
| `gcc`  | 行注释 |
| `gbc`  | 块注释 |

- 符号列表(symbols-outline)

| 快捷键  | 说明               |
| ------- | ------------------ |
| `<Tab>` | 打开符号列表侧边栏 |

- 终端(toggleterm)

| 快捷键   | 说明           |
| -------- | -------------- |
| `<C-\>`  | 打开或隐藏终端 |
| `2<C-\>` | 打开第二个终端 |

- 快速跳转(hop)

| 快捷键  | 说明               |
| ------- | ------------------ |
| `f`/`F` | line/word 快速跳转 |
