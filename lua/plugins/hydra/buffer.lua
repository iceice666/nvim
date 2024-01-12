local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
 Buffer Close
 
 _q_: close current
 _p_: close picked one
 _a_: all _o_: remain only 
 
 _<Esc>_: quit
]]

local close = Hydra({
  name = "BufferClose",
  hint = hint,
  config = {
    hint = {
      border = "rounded",
      offset = -1,
    },
  },
  mode = "n",

  heads = {
    {
      "q",
      function()
        vim.cmd("bd %")
      end,
      { desc = "current" },
    },
    {
      "o",
      function()
        vim.cmd("BufferLineCloseOthers")
      end,
      { desc = "remain only", exit = true },
    },
    {
      "a",
      function()
        vim.cmd("BufferLineCloseOthers")
      end,
      { desc = "all", exit = true },
    },
    {
      "p",
      function()
        vim.cmd("BufferLinePickClose")
      end,
      { desc = "close a picked one" },
    },
    { "<Esc>", nil, { exit = true } },
  },
})

hint = [[
 Buffer

 _P_: toggle pin  _c_: close opts 
 _p_: goto picked 

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
  -- stylua: ignore start
    { "p", cmd "BufferLinePick"},
    { "P", cmd "BufferLineTogglePin",},
    { "c", function() close:activate() end, { exit = true , nowait = true} },
    { "<Esc>", nil, { exit = true } },
  },
})
