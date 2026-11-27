-- 保留 Snacks Explorer，不加载内置 netrw。
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.neovide then
  vim.g.loaded_nvim_dir_plugin = 1
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.extra")