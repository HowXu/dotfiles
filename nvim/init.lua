-- 保留 Snacks Explorer，不加载内置 netrw。
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.extra")