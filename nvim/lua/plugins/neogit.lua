return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    {
      "sindrets/diffview.nvim",
      opts = {
        keymaps = {
          view = { { "n", "q", "<cmd>DiffviewClose<cr>" } },
          file_panel = { { "n", "q", "<cmd>DiffviewClose<cr>" } },
          file_history_panel = { { "n", "q", "<cmd>DiffviewClose<cr>" } },
        },
      },
    },
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
  }
}
