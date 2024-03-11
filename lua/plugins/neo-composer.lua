return {
  -- TODO: usage
  "ecthelionvi/NeoComposer.nvim",
  dependencies = "kkharji/sqlite.lua",
  opts = {
    keymaps = {
      play_macro = "Q",
      yank_macro = "yq",
      stop_macro = "cq",
      toggle_record = "qq",
      cycle_next = "q<c-n>",
      cycle_prev = "q<c-p>",
      toggle_macro_menu = "<c-q>",
    },
  },
}
