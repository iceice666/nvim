return {
  -- statuscolumn
  "luukvbaal/statuscol.nvim",
  event = "BufReadPost",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { "%s" }, click = "v:lua.ScSa" },
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
        },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
      },
    })
  end,
}
