return {
  -- Switch true/false
  "rmagatti/alternate-toggler",
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
  end,

  keys = {
    "<leader>ms",  "<cmd>ToggleAlternate<cr>", desc = "Switch true/false"
  }
}
