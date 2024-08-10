local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
 Tabpage

       Create    ^^^    Close   ^^    Goto      Move
 ----------------^^^ -----------^^ ----------- -------
 _n_: new             _c_: close    _]_: next  _>_: next
 _s_: split current   _o_: others   _[_: prev  _<_: prev
 ^ ^  into a new tab           ^   _\^_: first
                            ^^^^    _$_: last
 _<Esc>_: quit

]]

return Hydra({
  name = "Tabpage",
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
  on_enter = function()
    vim.bo.modifiable = false
  end,

  heads = {
    { "n",     cmd("tabnew"),      { nowait = true } },
    { "s",     cmd("tab split"),   { nowait = true } },
    { "c",     cmd("tabclose"),    { nowait = true } },
    { "o",     cmd("tabonly"),     { exit = true } },
    { "]",     cmd("tabnext"),     { nowait = true } },
    { "[",     cmd("tabprevious"), { nowait = true } },
    { ">",     cmd("tabmove +1"),  { nowait = true } },
    { "<",     cmd("tabmove -1"),  { nowait = true } },
    { "$",     cmd("tablast"),     { nowait = true } },
    { "^",     cmd("tabfirst"),    { nowait = true } },
    { "<Esc>", nil,                { exit = true } },
  },
})
