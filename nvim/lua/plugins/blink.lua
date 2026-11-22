return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    keymap = {
      ["<Tab>"] = { "accept", "fallback" },
      ["<CR>"] = {  "fallback" },
      ["<PageUp>"] = { function(cmp) return cmp.is_menu_visible() and cmp.select_prev({ count = 5 }) end, "fallback" },
      ["<PageDown>"] = { function(cmp) return cmp.is_menu_visible() and cmp.select_next({ count = 5 }) end, "fallback" },
    },
    completion = {
      ghost_text = { enabled = false },
      list = {
        selection = {
          preselect = true, -- 默认高亮第一项（根据你的习惯开启或关闭）
          auto_insert = false, -- 【关键】关闭上下选择时的自动输入
        },
      },
    },
    cmdline = {
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false, -- 【关键】命令行输入路径时，上下选择不自动输入
          },
        },
      },
      keymap = {
        preset = "cmdline", -- 继承 blink.cmp 为 cmdline 预设的按键

        -- 【关键】明确让回车键只做“接受补全”这件事，不要直接执行命令
        ["<CR>"] = { "fallback" },

        -- 上下键用来在列表中导航，不自动插入
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        -- 习惯用 Tab 键补全路径
        ["<Tab>"] = { "accept", "fallback" },
      },
    },
  },
}
