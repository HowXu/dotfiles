require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = str,
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1,
        symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]" },
      },
    },
    lualine_x = {
      {
        function()
          local fileformat = vim.bo.fileformat
          local fileencoding = vim.bo.fileencoding
          local filetype = vim.bo.filetype
          if fileformat == "" then
            fileformat = "None"
          end
          if fileencoding == "" then
            fileencoding = "Unknown"
          end
          if filetype == "" then
            filetype = "PlainText"
          end
          return string.format(" %s | %s | %s", fileformat, fileencoding, filetype)
        end,
        padding = { right = 1 },
      },
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      {
        "location",
        fmt = function()
          local line = vim.fn.line(".")
          local lines = vim.fn.line("$")
          local col = vim.fn.virtcol(".")
          return string.format("%d/%d:%d", line, lines, col)
        end,
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
})

-- 浅色行
vim.o.cursorline = true
