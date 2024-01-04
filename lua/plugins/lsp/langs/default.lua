return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(_, bufnr)
    -- stylua: ignore
    require("which-key").register({
      ["gpd"]         = { "<cmd>Lspsaga peek_definition<cr>",      "LSP: [G]oto [P]eek [D]efintion",        buffer = bufnr, },
      ["gpt"]         = { "<cmd>Lspsaga peek_type_definition<cr>", "LSP: [G]oto [P]eek [T]ype defintion",   buffer = bufnr, },
      ["gd"]          = { "<cmd>Lspsaga goto_definition<cr>",      "LSP: [G]oto [D]efiniton",               buffer = bufnr, },
      ["gtd"]         = { "<cmd>Lspsaga goto_type_definition<cr>", "LSP: [G]oto [T]ype [D]efiniton",        buffer = bufnr, },
      ["gk"]          = { "<cmd>Lspsaga hover_doc<cr>",            "LSP: rust: hover actions",              buffer = bufnr, },
      ["gK"]          = { "<cmd>Lspsaga hover_doc ++keep<cr>",     "LSP: Show doc and pinned at top right", buffer = bufnr, },
      ["g["]          = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "LSP: Goto prev diagnostic",             buffer = bufnr, },
      ["g]"]          = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "LSP: Goto next diagnostic",             buffer = bufnr, },
      ["gr"]          = { "<cmd>Lspsaga rename<cr>",               "LSP: [R]ename",                         buffer = bufnr, },
      ["gR"]          = { "<cmd>Lspsaga rename ++project<cr>",     "LSP: [R]ename include entire project",  buffer = bufnr, },
      ["gfr"]         = { "<cmd>Lspsaga finder ref<cr>",           "LSP: [F]inder: [R]eferences",           buffer = bufnr, },
      ["gfd"]         = { "<cmd>Lspsaga finder def<cr>",           "LSP: [F]inder: [D]efinition",           buffer = bufnr, },
      ["gfi"]         = { "<cmd>Lspsaga finder imp<cr>",           "LSP: [F]inder: [I]mplementation",       buffer = bufnr, },
      ["<leader>inc"] = { "<cmd>Lspsaga incoming_calls<cr>",       "LSP: Show [inc]oming calls",            buffer = bufnr, },
      ["<leader>out"] = { "<cmd>Lspsaga outgoing_calls<cr>",       "LSP: Show [out]going calls",            buffer = bufnr, },
      ["<leader>so"]  = { "<cmd>Lspsaga outline<cr>",              "LSP: Show [s]ymbol [o]utline",          buffer = bufnr, },
      ["<leader>ca"]  = { "<cmd>Lspsaga code_action<cr>",          "LSP: [C]ode [A]ction",                  buffer = bufnr, mode = { "n", "v" }, },
    })
  end,
}
