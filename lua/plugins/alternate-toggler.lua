return {
  -- Switch true/false
  "rmagatti/alternate-toggler",
  keys = "<leader>ms",
  cmd = "ToggleAlternate",
  config = function()
    require("alternate-toggler").setup({
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["yes"] = "no",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["==="] = "!==",
        ["!="] = "==",
        ["1"] = "0",
      },
    })

    local mapx = require("core.keymap").mapx
    local opt = { silent = true }
    -- Alternate toggler
    mapx.nnoremap("<leader>ms", "<cmd>ToggleAlternate<cr>", opt)
  end,
}
