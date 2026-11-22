return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    opts.options.middle_mouse_command = opts.options.close_command
  end,
}
