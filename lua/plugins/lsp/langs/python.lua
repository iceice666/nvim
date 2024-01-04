local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(_, bufnr)
    require("which-key").register({
      ["gpd"] = {
        "<cmd>Lspsaga peek_definition<cr>",
        desc = "LSP: [G]oto [P]eek [D]efintion",
        buffer = bufnr,
      },
      ["gpt"] = {
        "<cmd>Lspsaga peek_type_definition<cr>",
        desc = "LSP: [G]oto [P]eek [T]ype defintion",
        buffer = bufnr,
      },

      ["gd"] = {
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "LSP: [G]oto [D]efiniton",
        buffer = bufnr,
      },
      ["gtd"] = {
        "<cmd>Lspsaga goto_type_definition<cr>",
        desc = "LSP: [G]oto [T]ype [D]efiniton",
        buffer = bufnr,
      },

      ["gk"] = {
        "<cmd>RustHoverActions <cr>",
        desc = "LSP: rust: hover actions",
        buffer = bufnr,
      },
      ["gK"] = {
        "<cmd>Lspsaga hover_doc ++keep<cr>",
        desc = "LSP: Show doc and pinned at top right",
        buffer = bufnr,
      },

      ["g["] = {
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "LSP: Goto prev diagnostic",
        buffer = bufnr,
      },
      ["g]"] = {
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        desc = "LSP: Goto next diagnostic",
        buffer = bufnr,
      },

      ["gr"] = {
        "<cmd>Lspsaga rename ++project<cr>",
        desc = "LSP: [R]ename",
        buffer = bufnr,
      },

      ["gfr"] = {
        "<cmd>Lspsaga finder ref<cr>",
        desc = "LSP: [F]inder: [R]eferences",
        buffer = bufnr,
      },
      ["gfd"] = {
        "<cmd>Lspsaga finder def<cr>",
        desc = "LSP: [F]inder: [D]efinition",
        buffer = bufnr,
      },
      ["gfi"] = {
        "<cmd>Lspsaga finder imp<cr>",
        desc = "LSP: [F]inder: [I]mplementation",
        buffer = bufnr,
      },

      ["<leader>inc"] = {
        "<cmd>Lspsaga incoming_calls<cr>",
        desc = "LSP: Show [inc]oming calls",
        buffer = bufnr,
      },
      ["<leader>out"] = {
        "<cmd>Lspsaga outgoing_calls<cr>",
        desc = "LSP: Show [out]going calls",
        buffer = bufnr,
      },

      ["<leader>so"] = {
        "<cmd>Lspsaga outline<cr>",
        desc = "LSP: Show the [s]ymbol [o]utline of current buffer",
        buffer = bufnr,
      },
      ["<leader>ca"] = {
        "<cmd>Lspsaga code_action<cr>",
        desc = "LSP: [C]ode [A]ction",
        mode = { "n", "v" },
        buffer = bufnr,
      },
    })
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
})
