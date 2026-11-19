# Configs Backup

this repo posts my daily tool configs include:

Alacritty  
Gravel  
Nushell  
NeoVim  
Vim  
VSCodium  
Starship  
WezTerm  
[Yazi](yazi/BACKUP.md)\
Zshell  
Niri  
DMS  
Cursor in Linxu Gnome

## Maple 配色

配色取自 [Maple 的深浅主题定义](https://github.com/subframe7536/vscode-theme-maple/tree/2970814e9434e929e658a00c68b251833ba68cf6/themes)（[MIT](LICENSE-maple)）。这些文件可以离线使用。

| 应用 | 切换方法 |
| --- | --- |
| Starship | 把 `starship.toml` 第一行的 `palette` 设为 `"maple_dark"` 或 `"maple_light"`，下一个提示符生效。 |
| WezTerm | 把 `wezterm/colors/maple.lua` 的 `variant` 设为 `'dark'` 或 `'light'`。终端、标签页、标题栏和状态栏共用这个设置。 |
| Alacritty | 修改 `alacritty/alacritty.toml` 第一行的导入文件：`./maple-dark.toml` 或 `./maple-light.toml`。 |
| Neovim | 运行 `:colorscheme maple-light` 或 `:colorscheme maple-dark`；要保持到下次启动，修改 `nvim/lua/config/lazy.lua` 中 LazyVim 的 `opts.colorscheme`。 |
| Vim | 命令同 Neovim；启动主题在 `_vimrc`。如果只复制 vimrc 而不链接仓库，请同时把 `vim/colors/maple-*.vim` 复制到 Linux 的 `~/.vim/colors/` 或 Windows 的 `~/vimfiles/colors/`。 |
| Yazi | `yazi/theme.toml` 的 `[flavor]` 已分别指定 `dark` 和 `light`。Yazi 根据终端报告选择；若想固定主题，把两项设为同一个名字。文件列表和代码预览都包含在对应的 flavor 中。 |