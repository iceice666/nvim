local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
 Buffer

      close        ^^^  Move         Goto       ^^^     Sort by    
 ---------------   ^^^---------  ------------   ^^^----------------------- 
 _q_: current         _>_: next  ^ _]_: next        ^_e_: extension
 _p_: picked one      _<_: prev  ^ _[_: prev        ^_d_: directory
 _a_: all                       ^^^_s_: selected    ^_r_: relative directory 
 _o_: remain only                              ^^^^^^_t_: tabs
                                             ^^^^^^^^_P_: toggle pin
 _<Esc>_: quit
]]

Hydra({
  name = "Buffer",
  hint = hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      offset = -1,
    },
    color = "pink",
  },
  mode = "n",
  body = "<leader>b",

  heads = {
    { "s", cmd("BufferLinePick") },
    { "P", cmd("BufferLineTogglePin") },
    { "q", cmd("bd %") },
    { "o", cmd("BufferLineCloseOthers"), { exit = true } },
    { "a", cmd("BufferLineCloseOthers"), { exit = true } },
    { "p", cmd("BufferLinePickClose") },
    { ">", cmd("BufferLineMoveNext") },
    { "<", cmd("BufferLineMovePrev") },
    { "[", cmd("BufferLineCyclePrev") },

    { "e", cmd("BufferLineSortByExtension") },
    { "d", cmd("BufferLineSortByDirectory") },
    { "r", cmd("BufferLineSortByRelativeDirectory") },
    { "t", cmd("BufferLineSortByTabs") },
    { "]", cmd("BufferLineCycleNext") },
    { "<Esc>", nil, { exit = true } },
  },
})
