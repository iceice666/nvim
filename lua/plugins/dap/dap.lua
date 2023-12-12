-- [ DAP / Debug Adapter Protocol ]
return {
  -- core
  "mfussenegger/nvim-dap",
  keys = "<F6>",
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
    -- core
    "williamboman/mason.nvim",
    -- ui
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",

    -- langauges
    "mfussenegger/nvim-dap-python",

    "rcarriga/cmp-dap",
  },
  config = function()
    local colors = vim.g.colors
    local dap = require("dap")

    require("mason-nvim-dap").setup({
      ensure_installed = { "python", "go" },
      automatic_installation = true,
      automatic_setup = true,
    })
    require("dap-python").setup(
      "/home/iceice666/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    )

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Run current file",
        program = "${file}",
        console = "integratedTerminal",
      },
      {
        type = "python",
        request = "launch",
        name = "Run test.py",
        program = "${workspaceFolder}/src/test.py",
        console = "integratedTerminal",
      },
    }

    dap.adapters.codelldb = {
      type = "server",
      host = "127.0.0.1",
      port = 13000,
    }

    dap.configurations.rust = {
      {
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
          )
        end,
        cwd = "${workspaceFolder}",
        terminal = "integrated",
        sourceLanguages = { "rust" },
      },
    }

    require("dap-python").resolve_python = function()
      local py = vim.fn.expand(vim.fn.getcwd() .. "/.venv/bin/python")
      if vim.fn.filereadable(py) == 1 then
        return py
      else
        return "/usr/bin/python"
      end
    end
    local dapui = require("dapui")
    dapui.setup({
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.5,
            },
            {
              id = "stacks",
              size = 0.1,
            },
            {
              id = "watches",
              size = 0.3,
            },
            {
              id = "breakpoints",
              size = 0.1,
            },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 10,
          position = "bottom",
        },
      },
      controls = {
        enabled = false,
      },
    })

    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enable_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      filter_references_pattern = "<module",
      virt_text_pos = "eol",
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    })

    vim.api.nvim_set_hl(0, "DapBreakpoint", {
      ctermbg = 0,
      fg = colors.magenta2,
      bg = colors.bg,
    })
    vim.api.nvim_set_hl(0, "DapLogPoint", {
      ctermbg = 0,
      fg = colors.cyan,
      bg = colors.bg,
    })
    vim.api.nvim_set_hl(0, "DapStopped", {
      ctermbg = 0,
      fg = colors.green,
      bg = colors.bg,
    })

    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "ﳁ",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
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

    local mapx = vim.g.mapx

    mapx.nnoremap("<F5>", "<cmd>DapContinue<cr>", "Dap: Continue")
    mapx.nnoremap("<F17>", "<cmd>DapRerun<cr>", "Dap: Rerun")
    mapx.nnoremap("<F29>", "<cmd>DapTerminate<cr>", "Dap: Stop")

    mapx.nnoremap(
      "<F6>",
      "<cmd>lua require('dapui').toggle()<cr>",
      "Dap: Toggle debug ui"
    )
    mapx.nnoremap("<F30>", function()
      dap.repl.close()
    end, "Dap: Close repl")
    mapx.nnoremap(
      "<F9>",
      "<cmd>DapToggleBreakpoint<cr>",
      "Dap: Toggle breakpoint"
    )
    mapx.nnoremap("<F10>", "<cmd>DapStepOver<cr>", "Dap: Step over")
    mapx.nnoremap("<F11>", "<cmd>DapStepInto<cr>", "Dap: Step into")
    mapx.nnoremap("<F12>", "<cmd>DapStepOut<cr>", "Dap: Step out")
  end,
}
