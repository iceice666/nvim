local dap = require("dap")
require('mason-update-all').setup()
vim.cmd("silent MasonUpdateAll")
vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonUpdateAllComplete',
  callback = function()
    print(' ')
  end,
})
require("mason-nvim-dap").setup({
  ensure_installed = { "python" },
  automatic_installation = true,
})

require("mason-nvim-dap").setup_handlers({
  function(source_name)
    require('mason-nvim-dap.automatic_setup')(source_name)
  end,
  python = function()
    dap.adapters.python = {
      type = "executable",
      command = "debugpy-adapter",
      args = {}
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          -- return vim.fn.system("which python")
          return "/usr/bin/python"
        end

      }
    }
  end
})

local dapui = require("dapui")
dapui.setup({
  layouts = {
    {
      elements = {
        {
          id = 'scopes',
          size = 0.35
        },
        {
          id = "stacks",
          size = 0.35
        },
        {
          id = "watches",
          size = 0.15
        },
        {
          id = "breakpoints",
          size = 0.15
        },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl"
      },
      size = 5,
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

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end


vim.api.nvim_set_hl(0, 'DapBreakpoint', {
  ctermbg = 0,
  fg = '#b81c1c',
  bg = '#31353f',
})
vim.api.nvim_set_hl(0, 'DapLogPoint', {
  ctermbg = 0,
  fg = '#61afef',
  bg = '#31353f',
})
vim.api.nvim_set_hl(0, 'DapStopped', {
  ctermbg = 0,
  fg = '#98c379',
  bg = '#31353f'
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
mapx.nnoremap("<F6>", function()
  dapui.close({})
  dap.repl.close()
end)
mapx.nnoremap("<F9>", "<cmd>DapToggleBreakpoint<cr>")
mapx.nnoremap("<F10>", "<cmd>DapStepOver<cr>")
mapx.nnoremap("<F11>", "<cmd>DapStepInto<cr>")
mapx.nnoremap("<F12>", "<cmd>DapStepOut<cr>")
