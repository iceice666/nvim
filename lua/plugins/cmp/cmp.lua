return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
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

    "yehuohan/cmp-im",
    "yehuohan/cmp-im-zh",

    "ray-x/cmp-treesitter",
    "onsails/lspkind-nvim",

    -- Other
    "zbirenbaum/copilot-cmp",
    "lukas-reineke/cmp-under-comparator",
    "kawre/neotab.nvim",
  },
  config = function()
    local cmp = require("cmp")


    local lspkind = require("lspkind")
    lspkind.init({
      symbol_map = {
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
        Boolean = "",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "",
        KeywordFunction = "",
        KeywordCoroutine = "",
        KeywordOperator = "",
        KeywordConditional = "",
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

    local cmp_im = require("cmp_im")

    local neotab = require("neotab")

    cmp.setup({
      enabled = function()
        -- disable completion in comments
        local context = require("cmp.config.context")
        -- keep command mode completion enabled
        return vim.api.nvim_get_mode().mode == "c"
            -- prompt
            or vim.api.nvim_get_option_value("buftype", {}) ~= "prompt"
            -- comment
            and not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        -- dap buffer
        -- and not require("cmp_dap").is_dap_buffer()
      end,

      sources = {
        { name = "lazydev",    group_index = 0 },

        { name = "copilot",    group_index = 1 },
        { name = "emoji",      group_index = 1 },
        { name = "IM",         group_index = 1 },
        { name = "nerdfont",   group_index = 1 },
        { name = "crates",     group_index = 1 },

        { name = "nvim_lsp",   group_index = 2 },
        { name = "path",       group_index = 2 },
        { name = "treesitter", group_index = 2 },
        { name = "nvim_lua",   group_index = 2 },
        { name = "snippets",   group_index = 2, max_item_count = 10, },

        { name = "buffer",     group_index = 3 },
      },


      mapping = {
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            })
          elseif cmp.visible() and vim.g.isImEnable then
            cmp_im.select()
          else
            fallback()
          end
        end, { "i", "c" }),

        ["<S-CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.mapping.close()
          elseif require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").dismiss()
          else
            fallback()
          end
        end, { "i", "c" }),

        ["<esc>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),

        ["<Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif vim.g.ENABLE_NATIVE_SNIPPETS and vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          elseif require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            neotab.tabout()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif vim.g.ENABLE_NATIVE_SNIPPETS and vim.snippet.active({ direction = -1 }) then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-[>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ["<C-]>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),

        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
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



    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    if vim.g.ENABLE_NATIVE_SNIPPETS == false then
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  end,
}
