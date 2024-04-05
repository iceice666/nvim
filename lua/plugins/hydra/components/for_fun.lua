local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
 Just for fun :D

 ^^       Duck
 ^^--------------------- 
 _d_: New duck! 🦆
 _c_: Cook a duck! 🍳
 _C_: Cook all ducks! 🍗

 _<Esc>_: quit

]]

Hydra({
  name = "For fun",
  hint = hint,
  config = {
    invoke_on_body = true,
    hint = {
      float_opts = {
        border = "rounded",
      },
      offset = 1,
    },
    color = "pink",
  },
  mode = "n",
  body = "<leader>ff",
  on_enter = function()
    vim.bo.modifiable = false
  end,

  heads = {
    {
      "d",
      function()
        require("duck").hatch()
      end,
      { nowait = true },
    },
    {
      "c",
      function()
        require("duck").cook()
      end,
      { nowait = true },
    },
    {
      "C",
      function()
        require("duck").cook_all()
      end,
      { nowait = true },
    },

    { "<Esc>", nil, { exit = true } },
  },
})
