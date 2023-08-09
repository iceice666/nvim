return {
  {
    -- line peek
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
  },
  {
    -- eww yuck support
    "elkowar/yuck.vim",
    ft = { "yuck" },
  },
  {
    -- git sign
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "BufReadPre",
  },
  {
    -- hlsearch lens
    "kevinhwang91/nvim-hlslens",
    keys = "/",
    config = function()
      require("hlslens").setup()
    end,
  },
  {
    -- Structural search and replace
    "cshuaimin/ssr.nvim",
    event = "BufReadPre",
    config = function()
      require("ssr").setup({})
      vim.keymap.set({ "n", "x" }, "<leader>sr", function()
        require("ssr").open()
      end)
    end,
  },
}
