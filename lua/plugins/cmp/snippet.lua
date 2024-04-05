return { -- Snippets
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",
  config = function()
    require("luasnip").config.set_config({
      enable_autosnippets = true,
    })
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })
  end,
}
