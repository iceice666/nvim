-- [ DAP / Debug Adapter Protocol ]
return {
      "mfussenegger/nvim-dap",
      dependencies = {
        "rcarriga/cmp-dap",
        "theHamsta/nvim-dap-virtual-text",
        "LiadOz/nvim-dap-repl-highlights",
        "LiadOz/nvim-dap-repl-highlights",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui"
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
      -- FIXME: DapRerun is not a command
      -- FIXME: Selecting menu not show up
      keys = {
        {
          "<F5>",
          "<CMD>DapContinue<CR>",
          desc = "Dap: Continue",
        },
        { -- <S-F5>
          "<F17>",
          "<CMD>DapTerminate<CR>",
          desc = "Dap: Stop",
        },
        {
          "<F6>",
          function()
            require("dapui").toggle()
            require("dap").set_exception_breakpoints({ "uncaughted" })
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
        { "<F12>", "<cmd>DapStepOut<cr>",  desc = "Dap: Step out" },
      },
    },
    {
      "rcarriga/cmp-dap",
      lazy = true,
      config = function()
        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" },
          },
        })
      end
    }
