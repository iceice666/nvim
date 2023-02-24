return {
  -- statuscolumn
  -- TODO: Need config
  "luukvbaal/statuscol.nvim",
  event = "BufReadPost",
  config = function()
    require("statuscol").setup({
      order = "FSNs",
      setopt = true,
    })
  end,
}
