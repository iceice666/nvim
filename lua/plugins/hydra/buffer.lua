local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
 Buffer Close
 
 _q_: close current
 _a_: all _o_: remain only 
 _p_: close picked one
 
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
    on_key = function()
      -- Preserve animation
      vim.wait(200, function()
        vim.cmd("redraw")
      end, 30, false)
    end,
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

 _1_ ~ _9_: Goto buffer 1 ~ 9 
 _[_: prev _]_: next
 _q_: close _c_: close menu

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
  },
  mode = "n",
  body = "<leader>b",

  heads = {
  -- stylua: ignore start
    { "[", cmd "BufferLineCyclePrev", },
    { "]", cmd "BufferLineCycleNext", },
    { "1", cmd "BufferLineGoToBuffer 1",   { desc =false}   },
    { "2", cmd "BufferLineGoToBuffer 2",   { desc =false}   },
    { "3", cmd "BufferLineGoToBuffer 3",   { desc =false}   },
    { "4", cmd "BufferLineGoToBuffer 4",   { desc =false}   },
    { "5", cmd "BufferLineGoToBuffer 5",   { desc =false}   },
    { "6", cmd "BufferLineGoToBuffer 6",   { desc =false}   },
    { "7", cmd "BufferLineGoToBuffer 7",   { desc =false}   },
    { "8", cmd "BufferLineGoToBuffer 8",   { desc =false}   },
    { "9", cmd "BufferLineGoToBuffer 9",   { desc =false}   },
    { "q", cmd "bd %", },
    { "c", function() close:activate() end, {exit=true}},
    { "<Esc>", nil, { exit = true } },
    -- stylua: ignore end
  },
})
