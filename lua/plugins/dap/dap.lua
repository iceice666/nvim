-- [ DAP / Debug Adapter Protocol ]
return {
  -- core
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "LiadOz/nvim-dap-repl-highlights",
  },
  config = function()
    require("dap").set_exception_breakpoints({ "uncaughted" })

    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
      texthl = "DapBreakpint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "",
      texthl = "DapLogPoint",
      linehl = "DapLogPoint",
      numhl = "DapLogPoint",
    })
    vim.fn.sign_define("DapStopped", {
      text = "",
      texthl = "DapStopped",
      linehl = "DapStopped",
      numhl = "DapStopped",
    })
  end,
  -- FIXME: DapRerun is not a command
  -- FIXME: Selecting menu not show up
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Dap: Continue",
    },
    { -- <S-F5>
      "<F17>",
      function()
        require("dap").restart()
      end,
      desc = "Dap: Rerun",
    },
    { -- <C-F5>
      "<F29>",
      function()
        require("dap").terminate()
      end,
      desc = "Dap: Stop",
    },
    {
      "<F6>",
      function()
        require("dapui").toggle()
      end,
      desc = "Dap: Toggle debug ui",
    },
    {
      "<F7>",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Dap: Run to cursor",
    },
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Dap: Toggle breakpoint",
    },
    { "<F10>", "<cmd>DapStepOver<cr>", desc = "Dap: Step over" },
    { "<F11>", "<cmd>DapStepInto<cr>", desc = "Dap: Step into" },
    { "<F12>", "<cmd>DapStepOut<cr>", desc = "Dap: Step out" },
  },
}
