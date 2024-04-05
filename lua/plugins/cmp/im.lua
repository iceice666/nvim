return {
  "yehuohan/cmp-im",
  dependencies = {
    "yehuohan/cmp-im-zh",
  },
  keys = {
    {
      "<m-;>",
      function()
        vim.g.isImEnable = require("cmp_im").toggle()

        require("notify")(
          string.format(
            "IM is %s",
            vim.g.isImEnable and "enabled" or "disabled"
          ),
          "info"
        )
      end,
      desc = "Change IM",
      mode = { "i", "n", "c" },
    },
  },
  opts = {
    -- Enable/Disable IM
    enable = false,
    -- IM tables path array
    tables = require("cmp_im_zh").tables({ "pinyin" }),
    -- Function to format IM-key and IM-tex for completion display
    format = function(key, text)
      return vim.fn.printf("%-15S %s", text, key)
    end,
    -- Max number entries to show for completion of each table
    maxn = 8,
  },
}
