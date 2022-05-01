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
