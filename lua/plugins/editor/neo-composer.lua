return {
  -- TODO: usage
  "ecthelionvi/NeoComposer.nvim",
  dependencies = "kkharji/sqlite.lua",
  event = "VeryLazy",
  opts = {
    keymaps = {
      play_macro = "Q",
      yank_macro = "yq",
      stop_macro = "cq",
      toggle_record = "q",
      cycle_next = "<m-q>]",
      cycle_prev = "<m-q>[",
      toggle_macro_menu = "<c-q>",
    },
  },
}
