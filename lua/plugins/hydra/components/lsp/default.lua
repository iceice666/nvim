local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local fun = function(f, ...)
  local args = { ... }
  return function()
    f(table.unpack(args))
  end
end

local hint = [[
          Goto                              ^^^^^^Operation
 -------------------------^^^^  ^^^--------------------------------------------------
  _d_: peek definition         ^ _k_: hover doc          _fr_: find referance
  _t_: peek type definition    ^ _K_: pinned hover doc   _fd_: find definition
  _D_: goto definition         ^ _r_: rename             _fi_: find implementation
  _T_: goto type definition
                                                     ^^^^^_i_: incoming calls
                                                     ^^^^^_o_: outgoing calls
                                                     ^^^^^_s_: symbol
  _<Esc>_: quit                                        ^^^_a_: code action
  ]]

return Hydra({
  name = "LspDefault",
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

  heads = {
    -- stylua: ignore start
    { "d",     cmd("Lspsaga peek_definition"),       { exit = true } },
    { "t",     cmd("Lspsaga peek_type_definition"),  { exit = true } },
    { "D",     cmd("Lspsaga goto_definition"),       { exit = true } },
    { "T",     cmd("Lspsaga goto_type_definition"),  { exit = true } },
    { "k",     cmd("Lspsaga hover_doc"),             { exit = true } },
    { "K",     cmd("Lspsaga hover_doc ++keep"),      { exit = true } },

    -- leader is <space>
    { "r",     fun(vim.fn.feedkeys, " rn"),          { exit = true } },
    { "fr",    cmd("Lspsaga finder ref"),            { exit = true } },
    { "fd",    cmd("Lspsaga finder def"),            { exit = true } },
    { "fi",    cmd("Lspsaga finder imp"),            { exit = true } },
    { "i",     cmd("Lspsaga incoming_calls"),        { exit = true } },
    { "o",     cmd("Lspsaga outgoing_calls"),        { exit = true } },
    { "s",     cmd("Lspsaga outline"),               { exit = true } },
    { "a",     cmd("Lspsaga code_action") },
    { "<Esc>", nil,                                  { exit = true } },
  },
})
