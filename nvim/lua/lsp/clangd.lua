return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        clangd = {
          mason = false,
          cmd = {
            "clangd",
            "--background-index",
            "--background-index-priority=low",
            "--completion-style=detailed",
            "--function-arg-placeholders=0", -- 关闭函数参数占位符补全
            "--header-insertion=iwyu",
            "--pretty",
            "-j=4",
            "--limit-references=1000",
            "--limit-results=100",
            "--query-driver=g*",
            "--fallback-style=Microsoft",
          },
          init_options = {
            fallbackFlags = { "-std=c++20" },
          },
        },
      },
    },
  },
}
