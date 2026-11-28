-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- No macro
vim.keymap.set("n", "q", "<Nop>")

vim.keymap.set("n", "<M-w>", function()
  Snacks.bufdelete()
end, { desc = "关闭当前 buffer" })

-- 恢复 H/L 在当前窗口内的原生移动。
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "焦点移到左侧窗口" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "焦点移到右侧窗口" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "焦点移到上方窗口" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "焦点移到下方窗口" })

local function resize_explorer(delta)
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer then
    local win = explorer.layout.root.win
    vim.api.nvim_win_set_width(win, math.max(1, vim.api.nvim_win_get_width(win) + delta))
  end
end

vim.keymap.set("n", "<C-S-h>", function() resize_explorer(2) end, { desc = "加宽 Explorer" })
vim.keymap.set("n", "<C-S-l>", function() resize_explorer(-2) end, { desc = "收窄 Explorer" })

-- MiniMap quick
vim.keymap.set('n', '<leader>m', '<Nop>', { desc = "MiniMap Quick Set" })
vim.keymap.set('n', '<leader>md', '<cmd>Neominimap Disable<CR>', { desc = "Disable Neominimap" })
vim.keymap.set('n', '<leader>me', '<cmd>Neominimap Enable<CR>', { desc = "Enable Neominimap" })

Snacks.toggle.option("laststatus", { off = 0, on = 3, global = true, name = "底部状态栏" }):map("<leader>uB")

if vim.g.neovide then
  vim.keymap.set("x", "<C-S-c>", '"+y', { desc = "复制选区到系统剪贴板" })
  vim.keymap.set("c", "<C-S-c>", function()
    vim.fn.setreg("+", vim.fn.getcmdline(), "v")
  end, { desc = "复制当前命令到系统剪贴板" })

  vim.keymap.set("n", "<C-S-v>", '"+p', { desc = "从系统剪贴板粘贴" })
  vim.keymap.set("x", "<C-S-v>", '"+P', { desc = "用系统剪贴板替换选区" })
  vim.keymap.set({ "i", "c" }, "<C-S-v>", "<C-r><C-o>+", { desc = "在光标处粘贴系统剪贴板" })
end