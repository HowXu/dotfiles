-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- No macro
vim.keymap.set("n", "q", "<Nop>")

-- 恢复 H/L 在当前窗口内的原生移动。
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

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