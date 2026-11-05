# Yazi 配置备份与恢复

本目录是 Yazi 配置的实际存放位置，通过软链接供 Yazi 使用：

```text
~/.config/yazi -> ~/Projects/dotfiles/yazi
```

原配置来自 <https://github.com/emoeem/yazi>，基于上游提交 `4f71ac9`，保留了本机定制。`README.md` 是上游说明；本机的备份范围和恢复方式以本文为准。

## 纳入 Git 的内容

- `yazi.toml`：布局、显示偏好、预览规则。
- `keymap.toml`：快捷键。
- `theme.toml`：主题选择。
- `init.lua`：插件初始化。
- `package.toml`：插件和主题的依赖版本。
- `plugins/`：全部 27 个插件，包括手动插件和本地修复。
- `flavors/`：Dracula、Noctalia 两个主题及其配套文件。
- 插件、主题随附的许可证和文档。

仅备份 `package.toml` 不足以恢复当前环境：部分插件是手动安装的，且有本地修改。当前定制包括预览区比例 `[1, 5, 2]`、`q` 直接退出、Markdown 预览 API 兼容修复；Starship 插件保持启用。

## 不纳入 Git 的内容

`.gitignore` 排除以下运行数据：

- `pref-by-location`：包含本机路径的目录浏览偏好。迁移时保留现有文件，但不提交。
- `gvfs.private`、`gvfs_automounts.private`：私人挂载记录。

原上游仓库的 `.git/` 不复制进本目录。Yazi 的缓存、日志、项目状态及外部程序也不属于此配置备份。

## 恢复软链接

先把 dotfiles 仓库放到 `~/Projects/dotfiles`，退出正在运行的 Yazi，然后执行：

```bash
mkdir -p "$HOME/.config"
if [ -e "$HOME/.config/yazi" ] || [ -L "$HOME/.config/yazi" ]; then
    mv "$HOME/.config/yazi" "$HOME/.config/yazi.backup-$(date +%Y%m%d-%H%M%S)"
fi
ln -s "$HOME/Projects/dotfiles/yazi" "$HOME/.config/yazi"
```

之后修改任意一个路径下的配置，修改的都是仓库内的文件。

## 外部依赖与更新注意事项

迁移时使用 Yazi 26.9.1、`mdv` 4.2.1。`mdv` 位于 `~/.local/bin/mdv`，不包含在这个目录中；更新版本时应检查插件命令行参数兼容性。

其他功能按需依赖 Starship、fd（Debian 系通常叫 `fdfind`）、fzf、ripgrep、wl-clipboard、zoxide、FFmpeg、ImageMagick、MediaInfo、trash-cli、Lazygit、Pandoc、transmission-show 等外部程序。

图片预览还需要终端支持：Kitty 支持原生图片显示；使用 Alacritty 时需要额外的图片显示后端。仅安装 MediaInfo 不足以显示图片。

由于插件已完整保存，不必为了恢复配置再执行 `ya pkg install`。不要直接使用 `ya pkg install --discard` 或无检查地更新插件，以免覆盖本地定制。

应用入口 `~/.local/share/applications/yazi.desktop`、图标 `~/.local/share/icons/hicolor/256x256/apps/yazi.png`，以及 Kitty、niri 的设置不在本目录内；完整恢复桌面启动方式时需要另外备份和恢复它们。
