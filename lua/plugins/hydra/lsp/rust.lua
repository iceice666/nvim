local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
            Goto                         Operation
 ---------------------------  ^---------------------------------
  _pd_: peek definition         ^ _k_: hover doc        
  _pt_: peek type definition    ^ _K_: pinned hover doc
  _gd_: goto definition         ^ _r_: rename (in current buffer)
  _gt_: goto type definition    ^ _R_: rename (in project)
  _<Space>_: hover range        ^_fr_: find referance
                              ^^^_fd_: find definition
  _[_: jump prev diagnostic     ^_fi_: find implementation
  _]_: jump next diagnostic     ^ _i_: incoming calls
                              ^^^ _o_: outgoing calls
                              ^^^ _h_: hierarchy
                              ^^^ _a_: code action
                              ^^^ _e_: explain error
                              ^^^ _m_: expand macro
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

    { "pd", cmd("Lspsaga peek_definition") },
    { "pt", cmd("Lspsaga peek_type_definition") },
    { "gd", cmd("Lspsaga goto_definition") },
    { "gt", cmd("Lspsaga goto_type_definition") },
    { "<Space>", cmd("RustLsp hover range") },
    { "k", cmd("RustLsp hover actions") },
    { "K", cmd("Lspsaga hover_doc ++keep") },
    { "[", cmd("Lspsaga diagnostic_jump_prev") },
    { "]", cmd("Lspsaga diagnostic_jump_next") },

    { "r", cmd("Lspsaga rename"), { exit = true } },
    { "R", cmd("Lspsaga rename ++project"), { exit = true } },
    { "fr", cmd("Lspsaga finder ref"), { exit = true } },
    { "fd", cmd("Lspsaga finder def"), { exit = true } },
    { "fi", cmd("Lspsaga finder imp"), { exit = true } },
    { "i", cmd("Lspsaga incoming_calls"), { exit = true } },
    { "o", cmd("Lspsaga outgoing_calls"), { exit = true } },
    { "h", cmd("Lspsaga outline"), { exit = true } },
    { "a", cmd("Lspsaga code_action"), { exit = true } },
    { "e", cmd("RustLsp explainError"), { exit = true } },
    { "m", cmd("RustLsp expandMacro"), { exit = true } },
    { "<Esc>", nil, { exit = true } },
  },
})
