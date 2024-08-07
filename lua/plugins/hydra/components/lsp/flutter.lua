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
                             ^^^ _xd_: show devices          _o_: outgoing calls
                             ^^^ _xe_: show emulators        _s_: symbol
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

    { "r",       cmd("FlutterRename"),               { exit = true } },
    { "fr",      cmd("Lspsaga finder ref"),          { exit = true } },
    { "fd",      cmd("Lspsaga finder def"),          { exit = true } },
    { "fi",      cmd("Lspsaga finder imp"),          { exit = true } },
    { "i",       cmd("Lspsaga incoming_calls"),      { exit = true } },
    { "o",       cmd("Lspsaga outgoing_calls"),      { exit = true } },
    { "s",       cmd("FlutterOutlineToggle"),        { exit = true } },
    { "a",       cmd("Lspsaga code_action") },
    { "<Esc>",   nil,                                { exit = true } },
  },
})
