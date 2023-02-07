local colors = require("core.colors")
local dap = require("dap")

require("mason-nvim-dap").setup({
  ensure_installed = { "python", "go" },
  automatic_installation = true,
  automatic_setup = true
})
require('dap-python').setup('/home/iceice666/local/share/nvim/mason/packages/debugpy/venv/bin/python')

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Run current file',
    program = '${file}',
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Run test.py',
    program = '${workspaceFolder}/src/test.py'
  }
}



require('dap-python').resolve_python = function()
  return vim.fn.expand(vim.fn.getcwd() .. "/.venv/bin/python")
end
local dapui = require("dapui")
dapui.setup({
  layouts = {
    {
      elements = {
        {
          id = 'scopes',
          size = 0.5
        },
        {
          id = "stacks",
          size = 0.1
        },
        {
          id = "watches",
          size = 0.3
        },
        {
          id = "breakpoints",
          size = 0.1
        },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 10,
      position = "bottom",
    }
  },
  controls = {
    enabled = false
  }
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
  filter_references_pattern = '<module',
  virt_text_pos = 'eol',
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil
})



vim.api.nvim_set_hl(0, 'DapBreakpoint', {
  ctermbg = 0,
  fg = '#b81c1c',
  bg = colors.bg(),
})
vim.api.nvim_set_hl(0, 'DapLogPoint', {
  ctermbg = 0,
  fg = '#61afef',
  bg = colors.bg(),
})
vim.api.nvim_set_hl(0, 'DapStopped', {
  ctermbg = 0,
  fg = '#98c379',
  bg = colors.bg()
})

vim.fn.sign_define('DapBreakpoint', {
  text = "",
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define('DapBreakpointCondition', {
  text = 'ﳁ',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl = 'DapBreakpoint',
})
vim.fn.sign_define('DapBreakpointRejected', {
  text = "",
  texthl = "DapBreakpint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define('DapLogPoint', {
  text = '',
  texthl = 'DapLogPoint',
  linehl = 'DapLogPoint',
  numhl = 'DapLogPoint',
})
vim.fn.sign_define('DapStopped', {
  text = '',
  texthl = 'DapStopped',
  linehl = 'DapStopped',
  numhl = 'DapStopped',
})



local mapx = require("core.keymap").mapx

mapx.nnoremap("<F5>", "<cmd>DapContinue<cr>")
mapx.nnoremap("<F17>", "<cmd>DapTerminate<cr>")

mapx.nnoremap("<F6>", "<cmd>:lua require 'dapui'.open()<cr>")
mapx.nnoremap("<F18>", "<cmd>:lua require 'dapui'.close()<cr>")
mapx.nnoremap("<F30>", function()
  dap.repl.close()
end)
mapx.nnoremap("<F9>", "<cmd>DapToggleBreakpoint<cr>")
mapx.nnoremap("<F10>", "<cmd>DapStepOver<cr>")
mapx.nnoremap("<F11>", "<cmd>DapStepInto<cr>")
mapx.nnoremap("<F12>", "<cmd>DapStepOut<cr>")
