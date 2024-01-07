-- [ DAP / Debug Adapter Protocol ]
return {
  -- core
  "mfussenegger/nvim-dap",
  event = "BufReadPost",
  cmd = {
    "DapToggleBreakpoint",
    "DapStepOver",
    "DapStepInto",
    "DapStepOut",
    "DapRerun",
    "DapContinue",
    "DapTerminate",
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "LiadOz/nvim-dap-repl-highlights",
  },
  config = function()
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

  keys = {
    {
      "<F5>",
      "<cmd>DapContinue<cr>",
      desc = "Dap: Continue",
    },
    { "<F17>", "<cmd>DapRerun<cr>", desc = "Dap: Rerun" },
    { "<F29>", "<cmd>DapTerminate<cr>", desc = "Dap: Stop" },

    {
      "<F6>",
      function()
        require("dapui").toggle()
      end,
      desc = "Dap: Toggle debug ui",
    },
    {
      "<F30>",
      function()
        require("dap").repl.close()
      end,
      desc = "Dap: Close repl",
    },
    {
      "<F9>",
      "<cmd>DapToggleBreakpoint<cr>",
      desc = "Dap: Toggle breakpoint",
    },
    { "<F10>", "<cmd>DapStepOver<cr>", desc = "Dap: Step over" },
    { "<F11>", "<cmd>DapStepInto<cr>", desc = "Dap: Step into" },
    { "<F12>", "<cmd>DapStepOut<cr>", desc = "Dap: Step out" },
  },
}
