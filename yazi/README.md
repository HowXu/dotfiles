# 🦆 Yazi 配置

[![Yazi](https://img.shields.io/badge/Yazi-26.5.6-blue)](https://github.com/sxyazi/yazi)
[![Flavor](https://img.shields.io/badge/Theme-Dracula-purple)](https://github.com/dracula/yazi)

个人 Yazi 文件管理器配置，基于 Vim 风格键位，针对 Linux（Wayland）优化。

## 📸 预览

> Dracula 主题 + 全边框 + Starship 状态栏，三栏布局（父目录 : 文件列表 : 预览）

## 🚀 快速开始

```bash
# 1. 克隆本仓库
git clone https://github.com/emoeem/yazi.git ~/.config/yazi

# 2. 安装依赖（通过 ya 包管理器）
cd ~/.config/yazi && ya pkg install

# 3. 外部工具依赖
# - fd / fzf / zoxide / ripgrep : 搜索与跳转
# - transmission-cli             : 种子文件预览（torrent-preview）
# - pandoc                        : 文件格式转换（pandoc 插件）
# - ffmpeg                        : 媒体处理工具箱（ff-tools）
# - lazygit                       : Git 图形界面
# - wl-clipboard                  : Wayland 剪贴板（wl-clipboard 插件）
```

> **注意**：部分插件（gvfs、ff-tools、toggle-ratio、torrent-preview、chmod、bypass、cdhist、clipboard、simple-status）为手动安装，不受 `ya pkg` 管理，已包含在本仓库 `plugins/` 目录中。

## 📁 配置文件结构

```
~/.config/yazi/
├── yazi.toml          # 核心配置（布局、排序、预览、插件注册）
├── keymap.toml        # 全部快捷键映射
├── init.lua           # Lua 初始化（插件加载与配置）
├── package.toml       # ya 包管理器依赖声明
├── theme.toml         # 主题选择（dracula）
├── flavors/           # 主题文件
│   ├── dracula.yazi/
│   └── noctalia.yazi/
└── plugins/           # 全部插件
```

## ⚙️ yazi.toml 核心配置

| 配置项 | 值 | 说明 |
|--------|----|------|
| `ratio` | `[1, 3, 4]` | 三栏布局比例：父目录 : 文件列表 : 预览 |
| `sort_by` | `extension` | 默认按扩展名排序 |
| `sort_dir_first` | `true` | 目录始终排在文件前面 |
| `show_hidden` | `true` | 默认显示隐藏文件 |
| `show_symlink` | `true` | 显示符号链接标记 |
| `linemode` | `btime` | 默认行模式显示创建时间 |
| `scrolloff` | `8` | 光标距边缘保留 8 行再开始滚动 |
| `preview.wrap` | `yes` | 预览文本自动换行 |
| `preview.image_filter` | `lanczos3` | 图片预览使用高质量缩放 |
| `preview.max_size` | `10MB` | 超过此大小的文件不预览，防止卡顿 |
| `image_alloc` | `512MB` | 图片预览内存上限 |

## 🎨 主题

使用 [Dracula](https://github.com/dracula/yazi) 主题，搭配 `full-border` 插件为所有面板绘制边框，`starship` 插件在状态栏显示系统信息。

## 🧩 插件详解

### 包管理器管理的插件（package.toml）

| 插件 | 来源 | 说明 |
|------|------|------|
| **augment-command** | hankertrix/augment-command | 核心增强插件，提供智能进入、批量操作、归档/解压、平滑滚动等功能，是整个配置的基石 |
| **full-border** | yazi-rs/plugins:full-border | 为所有面板（父目录、文件列表、预览、状态栏）绘制圆角边框 |
| **starship** | Rolv-Apneseth/starship | 在状态栏集成 Starship prompt，显示系统信息（需系统安装 starship） |
| **git** | yazi-rs/plugins:git | 在文件列表中显示 Git 状态（已修改、已暂存、未追踪等） |
| **smart-filter** | yazi-rs/plugins:smart-filter | 连续按键即时过滤文件，无需输入回车，松手后自动恢复 |
| **zoom** | yazi-rs/plugins:zoom | 图片预览放大/缩小控制 |
| **mount** | yazi-rs/plugins:mount | 在 Yazi 内挂载/卸载硬盘 |
| **lazygit** | Lil-Dank/lazygit | 一键从当前 Git 仓库目录启动 Lazygit |
| **pref-by-location** | boydaihungst/pref-by-location | 按目录记忆偏好设置（排序方式、显示模式、隐藏文件等），切换目录时自动恢复 |
| **projects** | MasouShizuka/projects | 项目工作区管理——保存/加载/删除标签页组合，快速恢复工作状态 |
| **what-size** | pirafrank/what-size | 批量计算选中项或当前目录的总大小，支持复制结果到剪贴板 |
| **recycle-bin** | uhs-robert/recycle-bin | 将删除操作重定向到回收站（`~/.local/share/Trash`），防止误删 |
| **omni-trash** | goon/omni-trash | 回收站管理器，浏览和恢复已删除的文件 |
| **wl-clipboard** | grappas/wl-clipboard | Wayland 环境下将文件 URI 复制到系统剪贴板，可粘贴到其他应用 |
| **pandoc** | lmnek/pandoc | 使用 Pandoc 进行文件格式转换（如 Markdown → PDF、DOCX → HTML 等） |
| **mediainfo** | boydaihungst/mediainfo | 增强媒体文件预览：显示封面图片、元数据（编码、时长、分辨率等），支持图片/音频/视频/字幕 |
| **mdv-previewer** | WhoSowSee/mdv-previewer | 在预览面板中渲染 Markdown/TXT 文件，带语法高亮 |
| **whoosh** | WhoSowSee/whoosh | 书签管理——持久/临时书签，支持快捷键和 fzf 模糊搜索跳转、重命名、删除 |

### 手动安装的插件

| 插件 | 说明 |
|------|------|
| **gvfs** | GVFS 远程设备管理——挂载/卸载 MTP、SSH、SMB、WebDAV 等远程设备 |
| **ff-tools** | FFmpeg 媒体工具箱——提供裁剪、压缩、转码等媒体处理功能 |
| **toggle-ratio** | 面板布局快速切换——在默认、预览扩大、预览最大、隐藏父面板之间循环 |
| **torrent-preview** | 使用 transmission-show 预览 .torrent 种子文件内容 |
| **chmod** | 交互式修改文件/目录权限 |
| **bypass** | 穿透导航——在文件列表中用 h/l 直接穿透到父目录/预览面板 |
| **cdhist** | 目录浏览历史记录，可前后跳转 |
| **clipboard** | 系统剪贴板集成工具 |
| **simple-status** | 自定义状态栏（备用，当前使用 starship） |

## 🗑️ 回收站

本配置将 `d` 键映射为"移动到回收站"而非永久删除。删除的文件会进入系统的 Trash 目录（`~/.local/share/Trash`），可通过 `omni-trash` 插件（`R b`）管理。需要永久删除时使用 `D`。

## ⌨️ 快捷键完整映射

本配置基于 Vim 风格：**i/k 上下移动，j 返回上级，l 进入/打开**。

### 目录跳转

| 按键 | 功能 |
|------|------|
| `g h` | 跳转到主目录 `~` |
| `g d` | 跳转到下载目录 `~/Downloads` |
| `g p` | 跳转到图片目录 `~/Pictures` |
| `g v` | 跳转到视频目录 `~/Videos` |
| `g m` | 跳转到音乐目录 `~/Music` |
| `g w` | 跳转到文档目录 `~/Documents` |
| `g u` | 跳转到公共目录 `~/Public` |
| `g t` | 跳转到模板目录 `~/Templates` |
| `g c` | 跳转到配置目录 `~/.config` |
| `g y` | 跳转到 Yazi 配置目录 |
| `g /` | 跳转到根目录 |
| `g Space` | 交互式目录跳转（输入路径） |
| `g f` | 跟随符号链接 |
| `g l` | 在当前 Git 仓库打开 Lazygit |

### 光标移动

| 按键 | 功能 |
|------|------|
| `i` / `↑` | 上一个文件 |
| `k` / `↓` | 下一个文件 |
| `g g` | 跳到顶部 |
| `G` | 跳到底部 |
| `Ctrl+i` / `PageUp` | 向上移动半页 |
| `Ctrl+k` / `PageDown` | 向下移动半页 |
| `Shift+i` / `Shift+PageUp` | 向上移动一页 |
| `Shift+k` / `Shift+PageDown` | 向下移动一页 |

### 目录导航

| 按键 | 功能 |
|------|------|
| `j` / `←` | 返回上级目录 |
| `l` / `→` | 智能进入（目录进入、文件打开、压缩包解压） |
| `Shift+←` | 后退到上一个目录 |
| `Shift+→` | 前进到下一个目录 |

### 选择与视觉模式

| 按键 | 功能 |
|------|------|
| `Space` | 切换当前文件选中状态 |
| `Ctrl+a` | 全选 |
| `Ctrl+r` | 反选 |
| `u` | 取消全部选择 |
| `v` | 进入视觉模式（选择模式） |
| `V` | 进入视觉模式（取消选择模式） |

### 文件操作

| 按键 | 功能 |
|------|------|
| `o` / `Enter` | 打开文件 |
| `O` / `Shift+Enter` | 交互式打开（选择应用） |
| `y` | 复制（yank） |
| `x` | 剪切 |
| `p p` | 粘贴 |
| `p f` | 强制粘贴（覆盖） |
| `Y` / `X` | 取消复制/剪切状态 |
| `d` | 移到回收站 |
| `D` | 永久删除 |
| `a` | 创建文件/目录（名称以 `/` 结尾则创建目录） |
| `c r` | 创建文件（同 a） |
| `c z` | 创建压缩包 |
| `c l` | 创建符号链接（绝对路径） |
| `c L` | 创建符号链接（相对路径） |
| `c h` | 创建硬链接 |
| `c x` | 修改文件权限 |
| `c p` | 文件格式转换（Pandoc） |

### 复制路径信息

| 按键 | 功能 |
|------|------|
| `c c` | 复制完整路径 |
| `c d` | 复制目录路径 |
| `c f` | 复制文件名（含扩展名） |
| `c n` | 复制文件名（不含扩展名） |
| `Ctrl+y` | 复制文件到系统剪贴板（URI） |

### 重命名

| 按键 | 功能 |
|------|------|
| `r r` | 重命名（光标在扩展名前） |
| `r f` | 重命名（清空整个文件名） |
| `r i` | 重命名（光标在文件名开头） |
| `r a` | 重命名（光标在文件名末尾） |
| `r c` | 重命名（只清空文件名主体，保留扩展名） |

### Shell 命令

| 按键 | 功能 |
|------|------|
| `;` | 运行交互式 shell 命令（不阻塞） |
| `:` | 运行阻塞式 shell 命令 |

### 搜索与跳转

| 按键 | 功能 |
|------|------|
| `f` | 智能过滤（连续按键实时过滤，松开恢复） |
| `/` | 智能查找（当前目录内匹配文件名） |
| `?` | 反向查找 |
| `n` / `N` | 下一个/上一个匹配项 |
| `s` | 通过 fd 搜索文件名（递归子目录） |
| `S` | 通过 ripgrep 搜索文件内容 |
| `Ctrl+s` | 取消搜索 |
| `z` | 通过 fzf 跳转文件/目录 |
| `Z` | 通过 zoxide 跳转目录（需 frecency 数据） |

### 书签（whoosh 插件）

| 按键 | 功能 |
|------|------|
| `[` | 通过书签快捷键跳转 |
| `}` | 通过 fzf 模糊搜索跳转书签 |
| `] a` | 添加书签（当前文件/目录） |
| `] A` | 添加书签（当前目录） |
| `] t` | 添加临时书签（当前文件/目录） |
| `] T` | 添加临时书签（当前目录） |
| `] d` | 通过快捷键删除书签 |
| `] D` | 通过 fzf 搜索删除书签（支持 TAB 多选） |
| `] C` | 删除所有用户书签 |
| `] r` | 通过快捷键重命名书签 |
| `] R` | 通过 fzf 搜索重命名书签 |
| `Alt+k` | 直接跳转到书签 `k` |

### 标签页与项目

| 按键 | 功能 |
|------|------|
| `t` | 创建新标签页 |
| `1`-`9` | 切换到第 1-9 个标签页 |
| `-` / `=` | 切换到上一个/下一个标签页 |
| `Alt+[` / `Alt+]` | 与上一个/下一个标签页交换位置 |
| `P s` | 保存当前项目工作区 |
| `P l` | 加载项目工作区 |
| `P P` | 加载最近的项目工作区 |
| `P d` | 删除项目工作区 |
| `P D` | 删除所有项目工作区 |

### 显示设置

| 按键 | 功能 |
|------|------|
| `.` | 切换隐藏文件显示（同时保存到目录偏好） |
| `m s` | 行模式：显示大小 |
| `m p` | 行模式：显示权限 |
| `m b` | 行模式：显示创建时间 |
| `m m` | 行模式：显示修改时间 |
| `m o` | 行模式：显示所有者 |
| `m n` | 行模式：无信息 |
| `m d` | 计算选中项/当前目录大小 |
| `m D` | 计算大小并复制结果 |

### 排序

| 按键 | 功能 |
|------|------|
| `, m` / `, M` | 按修改时间排序（正序/倒序） |
| `, b` / `, B` | 按创建时间排序（正序/倒序） |
| `, e` / `, E` | 按扩展名排序（正序/倒序） |
| `, a` / `, A` | 按字母顺序排序（正序/倒序） |
| `, n` / `, N` | 自然排序（正序/倒序） |
| `, s` / `, S` | 按大小排序（正序/倒序） |
| `, r` | 随机排序 |
| `, t` | 切换目录偏好自动保存开关 |
| `, R` | 重置当前目录偏好 |

### 预览控制

| 按键 | 功能 |
|------|------|
| `Ctrl+↑` / `Ctrl+↓` | 预览内容向上/向下跳转 |
| `Tab` | 聚焦悬浮文件（Spot 模式） |
| `+` / `_` | 图片预览放大/缩小 |
| `F f` | FFmpeg 媒体工具箱 |
| `F p` | 切换媒体图片预览 |
| `F i` | 切换媒体元数据显示 |
| `F r` | 重置媒体预览设置 |

### 布局切换

| 按键 | 功能 |
|------|------|
| `L` | 循环切换面板布局（默认 → 预览扩大 → 预览最大 → 隐藏父面板） |
| `H` | 重置布局到默认 |

### 回收站与挂载

| 按键 | 功能 |
|------|------|
| `R b` | 打开回收站管理器 |
| `` ` `` | 跳回上一个目录（gvfs） |
| `M m` | 选择设备并挂载并跳转 |
| `M R` | 重新挂载当前目录的设备 |
| `M u` | 卸载并弹出设备 |
| `M U` | 强制卸载并弹出设备 |
| `M a` / `M e` / `M r` | 添加/编辑/移除挂载 URI |
| `M j` | 跳转到设备挂载点 |
| `M p` | 挂载硬盘 |

### 退出与杂项

| 按键 | 功能 |
|------|------|
| `q` | 退出（写 cwd 文件，shell 可跟随） |
| `Q` | 退出（不写 cwd 文件） |
| `Ctrl+c` | 关闭当前标签页 |
| `Ctrl+z` | 挂起程序 |
| `Esc` / `Ctrl+[` | 退出视觉模式/清除选择/取消搜索 |
| `w` | 显示任务管理器 |
| `~` / `F1` / `Ctrl+F1` | 打开帮助 |

### 输入模式（Vim 风格）

输入框内完全模拟 Vim 编辑器键位：

| 类别 | 按键 | 功能 |
|------|------|------|
| 模式 | `i` / `I` / `a` / `A` | 进入插入/追加模式 |
| 模式 | `v` / `V` | 进入视觉模式 |
| 模式 | `r` | 替换单个字符 |
| 字符 | `h`/`l`/`←`/`→` / `Ctrl+b`/`Ctrl+f` | 左右移动一个字符 |
| 单词 | `b`/`w`/`e` / `B`/`W`/`E` | 按单词/WORD 移动 |
| 单词 | `Alt+b` / `Alt+f` / `Ctrl+←`/`Ctrl+→` | Emacs 风格单词跳转 |
| 行 | `0`/`$`/`_`/`^` / `Home`/`End` / `Ctrl+a`/`Ctrl+e` | 行首/行尾/首字符 |
| 删除 | `Backspace`/`Ctrl+h` / `Delete`/`Ctrl+d` | 删除前/后字符 |
| 剪切 | `Ctrl+u`/`Ctrl+k` / `Ctrl+w`/`Alt+d` | 剪切到行首/行尾/单词 |
| 操作 | `d`/`c`/`y`/`p`/`P`/`x`/`s`/`D`/`C`/`S` | Vim 风格剪切/复制/粘贴/修改 |
| 撤销 | `u` / `Ctrl+r` | 撤销/重做 |
| 大小写 | `U` / `u`（视觉模式） | 转大写/转小写 |

## 🔄 augment-command 配置

`augment-command` 是本配置的核心增强插件，关键特性：

| 特性 | 状态 | 说明 |
|------|------|------|
| `smart_enter` | ✅ 开启 | `l` 键智能判断：目录→进入，文件→打开，压缩包→解压 |
| `skip_single_subdirectory_on_enter` | ✅ 开启 | 目录下只有一个子目录时自动穿透进入 |
| `skip_single_subdirectory_on_leave` | ✅ 开启 | 离开时自动跳过只有一个子目录的父目录 |
| `enter_archives` | ✅ 开启 | 直接进入压缩包浏览内容 |
| `recursively_extract_archives` | ✅ 开启 | 递归解压嵌套压缩包 |
| `confirm_on_quit` | ✅ 开启 | 退出时确认（避免误触） |
| `wraparound_file_navigation` | ✅ 开启 | 文件列表循环滚动（从末尾跳到开头） |
| `smooth_scrolling` | ❌ 关闭 | 平滑滚动（可手动开启） |

## 🔧 依赖清单

### 必需

| 工具 | 用途 |
|------|------|
| [yazi](https://github.com/sxyazi/yazi) | ≥ 26.5 |
| [starship](https://starship.rs) | 状态栏显示 |
| [fd](https://github.com/sharkdp/fd) | 文件名搜索 |
| [fzf](https://github.com/junegunn/fzf) | 模糊搜索 |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | 内容搜索 |
| [wl-clipboard](https://github.com/emersion/wl-clipboard) | Wayland 剪贴板 |

### 可选

| 工具 | 用途 |
|------|------|
| [zoxide](https://github.com/ajeetdsouza/zoxide) | 智能目录跳转 |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git 图形界面 |
| [pandoc](https://pandoc.org) | 文件格式转换 |
| [ffmpeg](https://ffmpeg.org) | 媒体处理 |
| [transmission-cli](https://www.transmissionbt.com) | 种子文件预览 |

## 📜 License

MIT
