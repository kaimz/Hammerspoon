# fork from https://github.com/S1ngS1ng/HammerSpoon

> 太长不看：[点我安装](#安装)

# 原作者仓库基础上自定义更改

- 移除了 VOX 播放器，因为个人不用，如果需要可以去原作者仓库下载添加就可以；
- 新增窗口 hint 管理，添加快捷键；
- 多显示器环境下，添加鼠标快速切换显示窗口。

# 安装

- **首先**安装 [HammerSpoon](https://github.com/Hammerspoon/hammerspoon)
- 下载、拷贝或者直接 `git clone` 这些文件：
  - init.lua - 主程序入口
  - key-binding.lua - 窗口管理快捷键配置
  - vim-binding.lua - 类 Vim 快捷键绑定
  - window-management.lua - 窗口管理
- 将`init.lua`, `key-binding.lua`, `vim-binding.lua`  `window-management.lua` 放到 `~/.hammerspoon` 路径下

# 快捷键

## 窗口管理

- 将窗口移动到另一屏幕
  - `Ctrl-Alt + Left` - 将当前窗口移动到左侧的屏幕
  - `Ctrl-Alt + Right` - 将当前窗口移动到右侧屏幕
- 窗口最大化
  - `Ctrl-Alt-Command + M`
- 将窗口居中（注：会保持窗口高度）
  - `Ctrl-Alt-Command + C`
- 布局窗口至二分之一当前屏幕大小
  - `Ctrl-Alt-Command + Left` - 窗口占屏幕左半部分
  - `Ctrl-Alt-Command + Right` - 窗口占屏幕右半部分
  - `Ctrl-Alt-Command + Up` - 窗口占屏幕上半部分
  - `Ctrl-Alt-Command + Down` - 窗口占屏幕下半部分
- 调整窗口右边、下边位置（保持左边、上边不变）
  - `Ctrl-Alt-Shift + Left` - 右边左移（窗口变小）
  - `Ctrl-Alt-Shift + Right` - 右边右移（窗口变大）
  - `Ctrl-Alt-Shift + Up` - 下边上移（窗口变小）
  - `Ctrl-Alt-Shift + Down` - 下边下移（窗口变大）
- 调整窗口左边、上边位置（保持右边、下边不变）
  - `Alt-Command-Shift + Left` - 左边左移（窗口变大）
  - `Alt-Command-Shift + Right` - 左边右移（窗口变小）
  - `Alt-Command-Shift + Up` - 上边上移（窗口变大）
  - `Alt-Command-Shift + Down` - 上边下移（窗口变小）
- 类 Windows 的窗口移动（调整窗口位置至相对于当前窗口的左右，效果请参考 Windows 系统下的快捷键 `win + 左/右`）
  - `Ctrl-Alt-Command + u`    将窗口移至相对于当前窗口的左方，并将窗口调整至二分之一屏幕大小
  - `Ctrl-Alt-Command + i`    将窗口移至相对于当前窗口的右方，并将窗口调整至二分之一屏幕大小
- 多显示器环境中，鼠标快速切换显示器，并显示在显示器中间（添加的新功能）
  - `Shift-Alt + Left/Right` 鼠标左右切换显示器
- hints 管理程序（添加的新功能）
  - `Shift-Alt + /` 显示应用程序，按显示的快捷键可以快速切换程序，当开启程序比较多的时候节约选择时间
  - 示例
    ![image.png](https://i.loli.net/2019/11/07/Nh3rz4WXctHnZR2.png)

## 类 Vim 全局快捷键绑定 (我已经把 `CapsLock` 替换为 `Ctrl`)

- 基本操作
  - `Ctrl + h` 左
  - `Ctrl + j` 下
  - `Ctrl + k` 上
  - `Ctrl + l` 右
- 与 `Alt` 配合使用
  - `Ctrl-Alt + H` 光标向左移动一个词
  - `Ctrl-Alt + L` 光标向右移动一个词
- 与 `Cmd` 配合使用
  - `Ctrl-Cmd + H` 光标移至行首
  - `Ctrl-Cmd + L` 光标移至行尾
- 与 `Shift` 配合使用
  - 上面所列出的操作，配合 `Shift` 可以实现选中功能和
