local Hydra = require("hydra")

local fun = function(f, ...)
  local args = { ... }
  return function()
    f(table.unpack(args))
  end
end
local cmd = require("hydra.keymap-util").cmd

local hint = [[
          Goto                                ^^^^^^Operation
 -------------------------^^^^  -------------------------------------------------
  _d_: peek definition         ^ _k_: hover doc         _fr_: find referance
  _t_: peek type definition    ^ _K_: pinned hover doc  _fd_: find definition
  _D_: goto definition         ^ _r_: rename            _fi_: find implementation
  _T_: goto type definition    ^ 
  _<Space>_: hover range       ^ _e_: explain error      _i_: incoming calls
                             ^^^ _m_: expand macro       _o_: outgoing calls
  _[_: jump prev diagnostic                        ^^^   _h_: hierarchy
  _]_: jump next diagnostic                        ^^^   _a_: code action
  
  _<Esc>_: quit
 ]]

return Hydra({
  name = "LspRust",
  hint = hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      offset = -1,
    },
    color = "pink",
  },

  heads = {

    { "d", cmd("Lspsaga peek_definition") },
    { "t", cmd("Lspsaga peek_type_definition") },
    { "D", cmd("Lspsaga goto_definition") },
    { "T", cmd("Lspsaga goto_type_definition") },
    { "<Space>", cmd("RustLsp hover range"), { exit = true } },
    { "k", cmd("RustLsp hover actions") },
    { "K", cmd("Lspsaga hover_doc ++keep") },
    { "[", cmd("Lspsaga diagnostic_jump_prev") },
    { "]", cmd("Lspsaga diagnostic_jump_next") },

    -- leader is <space>
    { "r", fun(vim.fn.feedkeys, " rn"), { exit = true } },
    { "fr", cmd("Lspsaga finder ref"), { exit = true } },
    { "fd", cmd("Lspsaga finder def"), { exit = true } },
    { "fi", cmd("Lspsaga finder imp"), { exit = true } },
    { "i", cmd("Lspsaga incoming_calls"), { exit = true } },
    { "o", cmd("Lspsaga outgoing_calls"), { exit = true } },
    { "h", cmd("Lspsaga outline"), { exit = true } },
    { "a", cmd("Lspsaga code_action") },
    { "e", cmd("RustLsp explainError"), { exit = true } },
    { "m", cmd("RustLsp expandMacro"), { exit = true } },
    { "<Esc>", nil, { exit = true } },
  },
})
