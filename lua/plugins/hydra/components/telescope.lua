local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd
local hint = [[
 🔭 Telescope

 _f_: files            _r_: recent files
 _g_: live grep        _/_: search in buffer/file 

 _:_: execute command  _h_: vim help 
 _;_: commands history _k_: keymaps 
 _?_: search history   _p_: resume / prev used 
 _n_: Noice history

 _<Enter>_ pickers           _<Esc>_ cancel

]]

Hydra({
  name = "Telescope",
  hint = hint,
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      position = "middle",
      float_opts = {
        border = "rounded",
      },
    },
    type = "window",
  },
  mode = "n",
  body = "<leader>t",
  heads = {
    { "f", cmd("Telescope find_files") },
    { "g", cmd("Telescope live_grep_args") },
    { "r", cmd("Telescope oldfiles"), { desc = "recently opened files" } },
    { "h", cmd("Telescope help_tags"), { desc = "vim help" } },
    { "k", cmd("Telescope keymaps") },
    { "p", cmd("Telescope resume") },
    {
      "/",
      cmd("Telescope current_buffer_fuzzy_find"),
      { desc = "search in file" },
    },
    { "?", cmd("Telescope search_history"), { desc = "search history" } },
    {
      ";",
      cmd("Telescope command_history"),
      { desc = "command-line history" },
    },
    { ":", cmd("Telescope commands"), { desc = "execute command" } },
    { "n", cmd("Telescope noice") },
    { "<Enter>", cmd("Telescope"), { exit = true, desc = "list all pickers" } },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})
