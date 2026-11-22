-- 用目录启动时，把它作为工作目录，显示启动页而不是目录列表。
if vim.fn.argc(-1) == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
  local dir = vim.fn.fnamemodify(vim.fn.argv(0), ":p")
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      if (vim.bo.filetype == "netrw" or vim.bo.filetype == "directory") and #vim.api.nvim_list_uis() > 0 then
        vim.api.nvim_set_current_dir(dir)
        Snacks.dashboard.open({ win = 0 })
      end
    end,
  })
end
