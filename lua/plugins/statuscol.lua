return {
  -- statuscolumn
  -- TODO: Need config
  "luukvbaal/statuscol.nvim",
  config = function()
    require("statuscol").setup({
      order = "FSNs",
      setopt = true,
    })
  end
}
