return {
  -- statuscolumn
  -- TODO: Need config
  "luukvbaal/statuscol.nvim",
  event = "BufReadPost",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
        { text = { "%s" },                  click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
      },
    })
  end,
}
