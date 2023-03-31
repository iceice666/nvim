return {
  DAPMessages = {
    condition = function()
      local session = require("dap").session()
      return session ~= nil
    end,
    provider = function()
      return " " .. require("dap").status()
    end,
    hl = "Debug",
    { provider = " " },
    {
      provider = "",
      on_click = {
        callback = function()
          require("dap").step_into()
        end,
        name = "heirline_dap_step_into",
      },
      hl = { fg = "blue" },
    },
    { provider = " " },
    {
      provider = "",
      on_click = {
        callback = function()
          require("dap").step_out()
        end,
        name = "heirline_dap_step_out",
      },
      hl = { fg = "blue" },
    },
    { provider = " " },
    {
      provider = " ",
      on_click = {
        callback = function()
          require("dap").step_over()
        end,
        name = "heirline_dap_step_over",
      },
      hl = { fg = "blue" },
    },
    { provider = " " },
    {
      provider = "ﰇ",
      on_click = {
        callback = function()
          require("dap").run_last()
        end,
        name = "heirline_dap_run_last",
      },
      hl = { fg = "green" },
    },
    { provider = " " },
    {
      provider = "",
      on_click = {
        callback = function()
          require("dap").terminate()
          require("dapui").close({})
        end,
        name = "heirline_dap_close",
      },
      hl = { fg = "red" },
    },
    { provider = " " },
  },
}
