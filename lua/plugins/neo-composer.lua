return {
  -- TODO: usage
  "ecthelionvi/NeoComposer.nvim",
  dependencies = "kkharji/sqlite.lua",
  opts = {
    keymaps = {
      play_macro = "Q",
      yank_macro = "yq",
      stop_macro = "cq",
      toggle_record = "q",
      cycle_next = "<m-q>n",
      cycle_prev = "<m-q>p",
      toggle_macro_menu = "<c-q>",
    },
  },
}
