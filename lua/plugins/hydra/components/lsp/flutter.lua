local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[
          Goto                             ^^^^^^  Operation
 -------------------------^^^^  ^^------------------------------------------------------
  _d_: peek definition         ^ _k_: hover doc              _fr_: find referance
  _t_: peek type definition    ^ _K_: pinned hover doc       _fd_: find definition
  _D_: goto definition         ^ _r_: rename                 _fi_: find implementation
  _T_: goto type definition
                             ^^^ _xr_: run current project   _i_: incoming calls
  _[_: jump prev diagnostic    ^ _xd_: show devices          _o_: outgoing calls
  _]_: jump next diagnostic    ^ _xe_: show emulators        _h_: hierarchy
                                                        ^^^^^_a_: code action
  _<Esc>_: quit            ^_<Enter>_: Telescope integration

  ]]

return Hydra({
  name = "LspFlutter",
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
    { "xr",      cmd("FlutterRun"),                  { exit = true } },
    { "xd",      cmd("FlutterDevices"),              { exit = true } },
    { "xe",      cmd("FlutterEmulators"),            { exit = true } },
    { "<Enter>", cmd("Telescope flutter commands"),  { exit = true } },

    { "d",       cmd("Lspsaga peek_definition") },
    { "t",       cmd("Lspsaga peek_type_definition") },
    { "D",       cmd("Lspsaga goto_definition") },
    { "T",       cmd("Lspsaga goto_type_definition") },
    { "k",       cmd("Lspsaga hover_doc") },
    { "K",       cmd("Lspsaga hover_doc ++keep") },
    { "[",       cmd("Lspsaga diagnostic_jump_prev") },
    { "]",       cmd("Lspsaga diagnostic_jump_next") },

    { "r",       cmd("FlutterRename"),               { exit = true } },
    { "fr",      cmd("Lspsaga finder ref"),          { exit = true } },
    { "fd",      cmd("Lspsaga finder def"),          { exit = true } },
    { "fi",      cmd("Lspsaga finder imp"),          { exit = true } },
    { "i",       cmd("Lspsaga incoming_calls"),      { exit = true } },
    { "o",       cmd("Lspsaga outgoing_calls"),      { exit = true } },
    { "h",       cmd("FlutterOutlineToggle"),        { exit = true } },
    { "a",       cmd("Lspsaga code_action") },
    { "<Esc>",   nil,                                { exit = true } },
  },
})
