-- langauges
return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  lazy = true,
  ft = "py",
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
  end,
}
