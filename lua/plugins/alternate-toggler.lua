return {
  -- Switch true/false
  "rmagatti/alternate-toggler",
  keys = {
    { "<leader>!", "<cmd>ToggleAlternate<cr>", desc = "Switch true/false" }
  },
  cmd = "ToggleAlternate",
  opts = {
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
  },
}
