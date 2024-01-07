-- langauges
return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local dap_python = require("dap-python")

    require("dap").configurations.python = {
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

    dap_python.setup(
      "/home/iceice666/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    )

    dap_python.resolve_python = function()
      local py = vim.fn.expand(vim.fn.getcwd() .. "/.venv/bin/python")
      if vim.fn.filereadable(py) == 1 then
        return py
      else
        return "/usr/bin/env python3"
      end
    end
  end,
}
