local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")

require("nvim-autopairs").setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end,
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp_signature_help" },
    { name = 'emoji' },
    { name = 'treesitter' },
    { name = "luasnip" },
    --    { name = "spell",
    --      option = {
    --        enable_in_context = function()
    --          if string.match(vim.bo.filetype, "markdown") then
    --            if string.match(vim.bo.filetype, "text") then
    --              return true
    --            end
    --          end
    --        end
    --      }
    --    }
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --     cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<s-CR>"] = cmp.mapping.abort()

  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)


-- vim.api.nvim_create_autocmd(
--  { "TextChangedI", "TextChangedP" },
--  {
--    callback = function()
--      local line = vim.api.nvim_get_current_line()
--      local cursor = vim.api.nvim_win_get_cursor(0)[2]
--
--      local current = string.sub(line, cursor, cursor + 1)
--      if current == "." or current == "," or current == " " then
--        cmp.close()
--      end
--
--      local before_line = string.sub(line, 1, cursor + 1)
--      local after_line = string.sub(line, cursor + 1, -1)
--      if not string.match(before_line, '^%s+$') then
--        if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
--          cmp.complete()
--        end
--      end
--    end,
--    pattern = "*"
--  })
--
