return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<S-h>", false },
    { "<S-l>", false },
  },
  opts = function(_, opts)
    opts.options.middle_mouse_command = opts.options.close_command
  end,
}
