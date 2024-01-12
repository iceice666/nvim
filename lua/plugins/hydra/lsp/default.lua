local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
            Goto                         Operation
 -------------------------^^  ----------------------------------
  _pd_: peek definition         ^ _r_: rename (in current buffer)
  _pt_: peek type definition    ^ _R_: rename (in project)
  _gd_: goto definition         ^_fr_: find referance
  _gt_: goto type definition    ^_fd_: find definition
                              ^^^_fi_: find implementation
                              ^^^ _i_: incoming calls
   _[_: jump prev diagnostic    ^ _o_: outgoing calls
   _]_: jump next diagnostic    ^ _h_: hierarchy
  ^ ^^                            _a_: code action
                              ^^^ _k_: hover doc        
                              ^^^ _K_: pinned hover doc 

  _<Esc>_: quit
 ]]

return Hydra({
  name = "LspDefault",
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
    { "k", cmd("Lspsaga hover_doc") },
    { "K", cmd("Lspsaga hover_doc ++keep") },
    { "[", cmd("Lspsaga diagnostic_jump_prev") },
    { "]", cmd("Lspsaga diagnostic_jump_next") },

    { "r", cmd("Lspsaga rename") },
    { "R", cmd("Lspsaga rename ++project") },
    { "fr", cmd("Lspsaga finder ref") },
    { "fd", cmd("Lspsaga finder def") },
    { "fi", cmd("Lspsaga finder imp") },
    { "i", cmd("Lspsaga incoming_calls") },
    { "o", cmd("Lspsaga outgoing_calls") },
    { "h", cmd("Lspsaga outline") },
    { "a", cmd("Lspsaga code_action") },
    { "<Esc>", nil, { exit = true } },
  },
})
