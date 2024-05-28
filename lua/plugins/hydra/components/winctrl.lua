local Hydra = require("hydra")
local splits = require("smart-splits")

local cmd = require("hydra.keymap-util").cmd
local pcmd = require("hydra.keymap-util").pcmd

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _o_: remain only
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^_m_: maximize^   _<Esc>_: cancel

 ]]

Hydra({
  name = "Windows",
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      float_opts = {
        border = "rounded",
      },
      offset = 1,
    },
  },
  mode = "n",
  body = "<c-w>",
  heads = {
    { "h", "<C-w>h" },
    { "j", "<C-w>j" },
    { "k", pcmd("wincmd k", "E11", "close") },
    { "l", "<C-w>l" },

    { "H", cmd("WinShift left") },
    { "J", cmd("WinShift down") },
    { "K", cmd("WinShift up") },
    { "L", cmd("WinShift right") },

    {
      "<C-h>",
      function()
        splits.resize_left(2)
      end,
    },
    {
      "<C-j>",
      function()
        splits.resize_down(2)
      end,
    },
    {
      "<C-k>",
      function()
        splits.resize_up(2)
      end,
    },
    {
      "<C-l>",
      function()
        splits.resize_right(2)
      end,
    },
    { "=",     cmd("WindowsEqualize"), { desc = "equalize", exit = true } },

    { "s",     pcmd("split", "E36") },
    { "v",     pcmd("vsplit", "E36") },

    { "m",     cmd("WindowsMaximize"), { exit = true, desc = "maximize" } },

    { "o",     "<C-w>o",               { exit = true, desc = "remain only" } },

    { "c",     pcmd("close", "E444") },

    { "<Esc>", nil,                    { exit = true } },
  },
})
