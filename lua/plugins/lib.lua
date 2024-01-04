return {
  {
    "b0o/mapx.nvim",
    -- which key
    dependencies = {
      "folke/which-key.nvim",
    },
    lazy = false,
    priority = 999,
    config = function()
      local mapx = require("mapx").setup({ whichkey = true })
      vim.g.mapx = mapx
    end,
  },
  {
    "TravonteD/luajob",
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "MunifTanjim/nui.nvim",
    module = true,
  },
}
