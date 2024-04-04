return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  keys = {
    {
      "<m-;>",
      function()
        vim.g.isIMEnable = require("cmp_im").toggle()
      end,
      desc = "Change IME",
      mode = { "i", "n" },
    },
  },
  dependencies = {
    -- sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",
    "chrisgrieser/cmp-nerdfont",
    "f3fora/cmp-spell",

    {
      "yehuohan/cmp-im",
      dependencies = {
        "yehuohan/cmp-im-zh",
      },
    },

    "saadparwaiz1/cmp_luasnip",
    "ray-x/cmp-treesitter",
    "onsails/lspkind-nvim",

    {
      -- "zbirenbaum/copilot-cmp",
      "KurisuNya/copilot-cmp",
      dependencies = {
        "zbirenbaum/copilot.lua",
      },
    },

    -- Other
    "lukas-reineke/cmp-under-comparator",
    "kawre/neotab.nvim",
    {
      "rcarriga/cmp-dap",
      dependencies = {
        "mfussenegger/nvim-dap",
      },
    },
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")
    lspkind.init({
      symbol_map = {
        Copilot = "",
        VariableMember = "󰜢",
        PunctuationSpecial = "󱔁",
        Number = "󰎠",
        Text = "󰉿",
        String = "󰀬",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "",
        KeywordFunction = "",
        Snippet = "󰅇",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "",
        TypeParameter = "",
        Type = "",
        Comment = "󰅺",
      },
    })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

    local cmp_im = require("cmp_im")
    cmp_im.setup({
      -- Enable/Disable IM
      enable = false,
      -- IM tables path array
      tables = require("cmp_im_zh").tables({ "pinyin" }),
      -- Function to format IM-key and IM-tex for completion display
      format = function(key, text)
        return vim.fn.printf("%-15S %s", text, key)
      end,
      -- Max number entries to show for completion of each table
      maxn = 8,
    })

    -- local has_words_before = function()
    --   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    --     return false
    --   end
    --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   return col ~= 0
    --     and vim.api
    --         .nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
    --         :match("^%s*$")
    --       == nil
    -- end

    local neotab = require("neotab")

    cmp.setup({
      enabled = function()
        -- disable completion in comments
        local context = require("cmp.config.context")
        -- keep command mode completion enabled when cursor is in a comment
        return vim.api.nvim_get_mode().mode == "c"
          or not ( -- comment
            context.in_treesitter_capture("comment")
            or context.in_syntax_group("Comment")
          )
          or not vim.api.nvim_buf_get_option(0, "buftype") == "prompt" -- prompt
          or not require("cmp_dap").is_dap_buffer() -- dap buffer
      end,
      sources = {
        { name = "emoji", group_index = 1 },
        { name = "IM", group_index = 1 },
        { name = "nerdfont", group_index = 1 },
        { name = "crates", group_index = 1 },

        { name = "copilot", group_index = 2 },

        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "treesitter", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        {
          name = "luasnip",
          option = { show_autosnippets = false },
          group_index = 2,
        },
        { name = "buffer", group_index = 3 },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            })
          else
            fallback()
          end
        end, { "i", "c" }),

        ["<S-CR>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),

        ["<esc>"] = cmp.mapping(function()
          cmp.mapping.abort()

          if not luasnip.in_snippet() then
            luasnip.unlink_current()
          end
        end, { "i", "c" }),

        ["<Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            neotab.tabout()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-[>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ["<C-]>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),

        ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
          col_offset = -3,
          side_padding = 0,
          border = "rounded",
          scrollbar = true,
        },
      },
      view = {
        docs = {
          auto_open = true,
        },
        entries = {
          follow_cursor = true,
        },
      },
      formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          if vim.tbl_contains({ "path" }, entry.source.name) then
            local icon, hl_group = require("nvim-web-devicons").get_icon(
              entry:get_completion_item().label
            )
            if icon then
              vim_item.kind = icon
              vim_item.kind_hl_group = hl_group
              vim_item.menu_hl_group = hl_group
              return vim_item
            end
          end

          local kind = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "",
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
              copilot = "[Copilot]",
            },
          })(entry, vim_item)

          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          local t = strings[2] or ""
          kind.menu = t .. string.rep(" ", 10 - #t) .. kind.menu

          return kind
        end,
      },
      sorting = {
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          require("cmp-under-comparator").under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
        priority_weight = 2,
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      enabled = function()
        -- Set of commands where cmp will be disabled
        local disabled = {
          IncRename = true,
        }
        -- Get first word of cmdline
        local cmd = vim.fn.getcmdline():match("%S+")
        -- Return true if cmd isn't disabled
        -- else call/return cmp.close(), which returns false
        return not disabled[cmd] or cmp.close()
      end,
    })

    cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
      sources = {
        { name = "dap" },
      },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
