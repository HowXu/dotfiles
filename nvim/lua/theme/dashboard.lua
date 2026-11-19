return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "SnacksDashboardOpened",
        callback = function(args)
          local open_new_buffer = function()
            vim.cmd("enew")
            vim.cmd("startinsert")
          end
          -- 在仪表盘界面专属绑定按键 (nowait = true 防止与其他快捷键冲突)
          vim.keymap.set("n", "n", open_new_buffer, { buffer = args.buf, nowait = true, desc = "New Buffer" })
          vim.keymap.set("n", "a", open_new_buffer, { buffer = args.buf, nowait = true, desc = "New Buffer" })
          vim.keymap.set("n", "i", open_new_buffer, { buffer = args.buf, nowait = true, desc = "New Buffer" })
        end,
      })
    end,
    opts = function(_, opts)
      -- 1. Define custom highlight groups
      vim.api.nvim_set_hl(0, "IntroBlue", { fg = "#3E93D3", default = true })
      vim.api.nvim_set_hl(0, "IntroGreen", { fg = "#69A33E", default = true })

      -- 2. Build dynamic version/news strings
      local version = vim.version()
      local prerelease_suffix = ""
      if version.prerelease then
        local prerelease = type(version.prerelease) == "string" and version.prerelease or "dev"
        prerelease_suffix = "-" .. prerelease
        if version.build then
          prerelease_suffix = prerelease_suffix .. "+" .. version.build
        end
      end

      local version_text = ("NVIM v%d.%d.%d%s For HowXu"):format(version.major, version.minor, version.patch, prerelease_suffix)
      local news_text = ("v%d.%d news here!"):format(version.major, version.minor)

      -- Ensure dashboard is initialized
      opts.dashboard = opts.dashboard or {}

      -- 3. Override dashboard layout completely with the custom ASCII and text chunks
      opts.dashboard.sections = {
        { padding = 0 }, -- Top margin to push everything down naturally
        {
          align = "center",
          text = {
            { "│", hl = "IntroBlue" },
            { " ╲ ││", hl = "IntroGreen" },
          },
        },
        {
          align = "center",
          text = {
            { "││", hl = "IntroBlue" },
            { "╲╲││", hl = "IntroGreen" },
          },
        },
        {
          align = "center",
          text = {
            { "││", hl = "IntroBlue" },
            { " ╲ │", hl = "IntroGreen" },
          },
        },
        { padding = 0 },
        { align = "center", text = { { version_text , hl = "String" } } },
        { padding = 0 },
        { align = "center", text = "Nvim is open source and freely distributable" },
        {
          align = "center",
          text = {
            { " ", hl = "Normal" }, -- 左侧隔离，防止左侧填充空格继承下划线
            { "https://neovim.io/#chat", hl = "Underlined" },
            { " ", hl = "Normal" }, -- 右侧截断，强制停止下划线的延伸
          },
        },
        { padding = 0 },
        -- Commands block (Padded to exactly 52 chars internally so the colons perfectly align)
        {
          align = "center",
          text = {
            { "        type  ", hl = "Normal" },
            { ":", hl = "SpecialKey" },
            { "help nvim", hl = "Identifier" },
            { "<Enter>", hl = "SpecialKey" },
            { "       if you are new!       ", hl = "Normal" },
          },
        },
        {
          align = "center",
          text = {
            { "        type  ", hl = "Normal" },
            { ":", hl = "SpecialKey" },
            { "checkhealth", hl = "Identifier" },
            { "<Enter>", hl = "SpecialKey" },
            { "     to optimize Nvim      ", hl = "Normal" },
          },
        },
        {
          align = "center",
          text = {
            { "        type  ", hl = "Normal" },
            { ":", hl = "SpecialKey" },
            { "q", hl = "Identifier" },
            { "<Enter>", hl = "SpecialKey" },
            { "               to exit               ", hl = "Normal" },
          },
        },
        {
          align = "center",
          text = {
            { "        type  ", hl = "Normal" },
            { ":", hl = "SpecialKey" },
            { "help", hl = "Identifier" },
            { "<Enter>", hl = "SpecialKey" },
            { "            for help              ", hl = "Normal" },
          },
        },
        { padding = 1 },
        {
          align = "center",
          text = {
            { "        type  ", hl = "Normal" },
            { ":", hl = "SpecialKey" },
            { "help news", hl = "Identifier" },
            { "<Enter>", hl = "SpecialKey" },
            -- Use string.format to ensure dynamic news text always pads out to exactly 29 chars
            { string.format("       %-22s", news_text), hl = "Normal" },
          },
        },
        { padding = 1 },
        { section = "startup" },
      }
    end,
  },
}
