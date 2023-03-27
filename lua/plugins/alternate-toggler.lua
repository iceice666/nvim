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

    -- Alternate toggler
    vim.g.mapxnnoremap(
      "<leader>ms",
      "<cmd>ToggleAlternate<cr>",
      { silent = true }
    )
  end,
}
