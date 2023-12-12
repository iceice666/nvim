local mapx = vim.g.mapx

local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- stylua: ignore
local nnoremaps = {
  ["gpd"] = { "<cmd>Lspsaga peek_definition<cr>", "LSP: [G]oto [P]eek [D]efintion" },
  ["gpt"] = { "<cmd>Lspsaga peek_type_definition<cr>", "LSP: [G]oto [P]eek [T]ype defintion" },

  ["gd"]  = { "<cmd>Lspsaga goto_definition<cr>", "LSP: [G]oto [D]efiniton" },
  ["gtd"] = { "<cmd>Lspsaga goto_type_definition<cr>", "LSP: [G]oto [T]ype [D]efiniton" },

  ["gk"]  = { "<cmd>Lspsaga hover_doc <cr>", "LSP: Show doc" },
  ["gK"]  = { "<cmd>Lspsaga hover_doc ++keep<cr>", "LSP: Show doc and pinned at top right" },

  ["g["]  = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "LSP: Goto prev diagnostic" },
  ["g]"]  = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "LSP: Goto next diagnostic" },

  ["gr"]  = { "<cmd>Lspsaga rename ++project<cr>", "LSP: [R]ename" },

  ["gfr"] = { "<cmd>Lspsaga finder ref<cr>", "LSP: [F]inder: [R]eferences" },
  ["gfd"] = { "<cmd>Lspsaga finder def<cr>", "LSP: [F]inder: [D]efinition" },
  ["gfi"] = { "<cmd>Lspsaga finder imp<cr>", "LSP: [F]inder: [I]mplementation" },


  ["<leader>inc"] = { "<cmd>Lspsaga incoming_calls<cr>", "LSP: Show [inc]oming calls" },
  ["<leader>out"] = { "<cmd>Lspsaga outgoing_calls<cr>", "LSP: Show [out]going calls" },

  ["<leader>so"]  = { "<cmd>Lspsaga outline<cr>", "LSP: Show the [s]ymbol [o]utline of current buffer" },
  ["<leader>ca"]  = { "<cmd>Lspsaga code_action<cr>", "LSP: [C]ode [A]ction" }
}

local vnoremaps = {
  ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "LSP: [C]ode [A]ction" },
}

-- mapping keybind
local do_map = function(bufnr, nnms, vnms)
  mapx.group({ silent = true, buffer = bufnr }, function()
    for k, v in pairs(nnms) do
      mapx.nnoremap(k, v[1], v[2])
    end
    for k, v in pairs(vnms) do
      mapx.vnoremap(k, v[1], v[2])
    end
  end)
end

-- default:
-- {
--  on_attach = function ()
--     ...mapping...
--  end,
--  capabilities = capabilities
-- }

local lsp_config = function(settings, nmaps, vmaps)
  settings = settings or {}
  nmaps = nmaps or nnoremaps
  vmaps = vmaps or vnoremaps

  return (
    vim.tbl_extend("force", {
      on_attach = function(_, bufnr)
        do_map(bufnr, nmaps, vmaps)
      end,
      capabilities = capabilities,
    }, settings)
  )
end

return {
  nnoremaps = function()
    return vim.deepcopy(nnoremaps)
  end,
  vnoremaps = function()
    return vim.deepcopy(vnoremaps)
  end,
  lsp_config = lsp_config,
  capabilities = capabilities,
}
