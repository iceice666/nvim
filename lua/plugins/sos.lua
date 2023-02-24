return {
  -- auto saver
  "tmillr/sos.nvim",
  event = "InsertEnter",
  keys = {
    "p",
    "P", -- paste
    "dd", -- delete line
    "d ", -- clear line
    "V", -- visual mode
    "c", -- cut
  },
  config = function()
    require("sos").setup({
      timeout = 30000,
      autowrite = true,
      save_on_cmd = "some",
      save_on_bufleave = true,
      save_on_focuslost = true,
    })
  end,
}
