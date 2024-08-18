return {
  -- TODO: usage
  "ecthelionvi/NeoComposer.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  event = "VeryLazy",
  opts = {
    keymaps = {
      play_macro = false,
      yank_macro = false,
      stop_macro = false,
      toggle_record = false,
      cycle_next = false,
      cycle_prev = false,
      toggle_macro_menu = false,
    },
  },
  keys = {
    group = "Macro",
    {
      "q",
      function()
        require("NeoComposer.macro").toggle_record()
      end,
      desc = "Record macro"
    },
    {
      "Q",
      function()
        require("NeoComposer.macro").toggle_play_macro()
      end,
      desc = "Play macro"
    },
    {
      "<m-q>]",
      function()
        require("NeoComposer.ui").cycle_next()
      end,
      desc = "Cycle next macro"
    },
    {
      "<m-q>[",
      function()
        require("NeoComposer.ui").cycle_prev()
      end,
      desc = "Cycle prev macro"
    },
    {
      "<c-q>",
      function()
        require("NeoComposer.ui").toggle_macro_menu()
      end,
      desc = "Toggle macro menu"
    },
    {
      "<m-q>y",
      function()
        require("NeoComposer.macro").yank_macro()
      end,
      desc = "Yank macro"
    },
    {
      "<m-q>s",
      function()
        require("NeoComposer.macro").stop_macro()
      end,
      desc = "Stop macro"
    }
  }
}
