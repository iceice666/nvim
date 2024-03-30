local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
 Buffer

      Close      ^^^  Move        Goto     ^^^^     Sort by    
 --------------- ^^^--------- ------------ ^^^^----------------------- 
  _p_: picked one   _>_: next ^ _]_: next       ^_e_: extension
  _a_: all          _<_: prev ^ _[_: prev       ^_d_: directory
  _o_: others               ^^ _\^_: first      ^_r_: relative directory 
                          ^^^^^ _$_: last       ^_t_: tabs
                           ^^^^^_s_: selected
 _<Esc>_: quit                             ^^^^^^_P_: toggle pin

]]

Hydra({
  name = "Buffer",
  hint = hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      offset = 1,
    },
    color = "pink",
  },
  mode = "n",
  body = "<leader>b",
  on_enter = function()
    vim.bo.modifiable = false
  end,

  heads = {
    { "s", cmd("BufferLinePick") },
    { "P", cmd("BufferLineTogglePin") },
    { "o", cmd("BufferLineCloseOthers"), { exit = true } },
    { "a", cmd("BufferLineCloseOthers") .. cmd("bd%"), { exit = true } },
    { "p", cmd("BufferLinePickClose") },
    { ">", cmd("BufferLineMoveNext"), { nowait = true } },
    { "<", cmd("BufferLineMovePrev"), { nowait = true } },

    { "[", cmd("BufferLineCyclePrev"), { nowait = true } },
    { "]", cmd("BufferLineCycleNext"), { nowait = true } },
    { "^", cmd("bfirst"), { nowait = true } },
    { "$", cmd("blast"), { nowait = true } },

    { "e", cmd("BufferLineSortByExtension") },
    { "d", cmd("BufferLineSortByDirectory") },
    { "r", cmd("BufferLineSortByRelativeDirectory") },
    { "t", cmd("BufferLineSortByTabs") },
    { "<Esc>", nil, { exit = true } },
  },
})
