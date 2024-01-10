return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
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
    {
      "<leader>g",
      function()
        if vim.fn.getcwd() == vim.fn.getenv("HOME") then
          -- Use lazygit when at $HOME for bare repo support
          vim.cmd("TermExec cmd=\"lazygit --work-tree=$HOME --git-dir=.dotfiles.git\"")
        else
          vim.cmd("Neogit")
        end
      end,
      desc = "Open vsc"
    },
  },
}
