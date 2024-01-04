local util = require("lspconfig/util")
vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      -- whether the hover action window gets automatically focused
      auto_focus = true,
    },
    executors = require("rustaceanvim.executors").quickfix,
  },
  server = {
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          ignore = { "unused_variables", "dead_code" },
        },
      },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client, bufnr)
      -- stylua: ignore
      require("which-key").register({
        ["g["]          = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "LSP: Goto prev diagnostic",             buffer = bufnr, },
        ["g]"]          = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "LSP: Goto next diagnostic",             buffer = bufnr, },
        ["gpd"]         = { "<cmd>Lspsaga peek_definition<cr>",      "LSP: [G]oto [P]eek [D]efintion",        buffer = bufnr, },
        ["gpt"]         = { "<cmd>Lspsaga peek_type_definition<cr>", "LSP: [G]oto [P]eek [T]ype defintion",   buffer = bufnr, },
        ["gd"]          = { "<cmd>Lspsaga goto_definition<cr>",      "LSP: [G]oto [D]efiniton",               buffer = bufnr, },
        ["gtd"]         = { "<cmd>Lspsaga goto_type_definition<cr>", "LSP: [G]oto [T]ype [D]efiniton",        buffer = bufnr, },

        ["g<space>"]    = { "<cmd>RustLsp hover range<cr>",          "Rust: Hover range",                     buffer = bufnr, },

        ["<leader>ee"]  = { "<cmd>RustLsp explainError<cr>",         "Rust: Explain error",                   buffer = bufnr, mode = { "n", "v" } },
        ["<leader>k"]   = { "<cmd>RustLsp hover actions<cr>",        "Rust: Show doc and jump action",        buffer = bufnr, },
        ["<leader>K"]   = { "<cmd>Lspsaga hover_doc ++keep<cr>",     "LSP: Show doc and pinned at top right", buffer = bufnr, },

        ["<leader>rf"]  = { "<cmd>Lspsaga rename<cr>",               "LSP: [R]ename (in current [f]ile)",     buffer = bufnr, },
        ["<leader>rp"]  = { "<cmd>Lspsaga rename ++project<cr>",     "LSP: [R]ename (in entire [p]roject)",   buffer = bufnr, },
        ["<leader>fr"]  = { "<cmd>Lspsaga finder ref<cr>",           "LSP: [F]inder: [R]eferences",           buffer = bufnr, },
        ["<leader>fd"]  = { "<cmd>Lspsaga finder def<cr>",           "LSP: [F]inder: [D]efinition",           buffer = bufnr, },
        ["<leader>fi"]  = { "<cmd>Lspsaga finder imp<cr>",           "LSP: [F]inder: [I]mplementation",       buffer = bufnr, },
        ["<leader>inc"] = { "<cmd>Lspsaga incoming_calls<cr>",       "LSP: Show [inc]oming calls",            buffer = bufnr, },
        ["<leader>out"] = { "<cmd>Lspsaga outgoing_calls<cr>",       "LSP: Show [out]going calls",            buffer = bufnr, },
        ["<leader>so"]  = { "<cmd>Lspsaga outline<cr>",              "LSP: Show [s]ymbol [o]utline",          buffer = bufnr, },
        ["<leader>ca"]  = { "<cmd>RustLsp codeAction<cr>",           "LSP: [C]ode [A]ction",                  buffer = bufnr, mode = { "n", "v" } },
        ["<leader>oc"]  = { "<cmd>RustLsp openCargo<cr>",            "Rust: Open Cargo.toml",                 buffer = bufnr, },
      })
      require("lsp-inlayhints").on_attach(client, bufnr)
      require("lsp-inlayhints").show()
    end,
  },
}
