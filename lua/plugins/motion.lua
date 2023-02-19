return {
  -- Cursor motion
  "ggandor/leap.nvim",
  event = "BufReadPost",
  dependencies = {
    "tpope/vim-repeat"
  },
  config = function()
    local leap = require("leap")
    leap.add_default_mappings()
    leap.opts.highlight_unlabeled_phase_one_targets = true
  end
}
