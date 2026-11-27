return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<S-h>", false },
    { "<S-l>", false },
    { "[b", false },
    { "]b", false },
    { "<S-Left>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-Right>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = function(_, opts)
    opts.options.middle_mouse_command = opts.options.close_command
  end,
}
