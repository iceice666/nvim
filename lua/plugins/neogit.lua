return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  cmd = { "Neogit" },
  opts = {
    status = {
      recent_commit_count = 114514,
    },
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "", "" },
      item = { "", "" },
      section = { "", "" },
    },
    graph_style = "unicode",
  },
  config = true,
  keys = {
    { "<leader>g", "<CMD>Neogit<CR>", desc = "Open vsc" },
  },
}
