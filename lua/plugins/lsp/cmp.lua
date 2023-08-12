return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  keys = {
    "?",
    "/",
  },
  dependencies = {
    -- sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
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

    -- Snippets

    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip").config.set_config({
          enable_autosnippets = true,
        })
        require("luasnip.loaders.from_lua").load({
          paths = vim.fn.stdpath("config") .. "/snippets",
        })
      end,
    },
    "onsails/lspkind-nvim",

    -- Other
    "lukas-reineke/cmp-under-comparator",
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

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

    vim.g.mapx.inoremap("<a-;>", function()
      vim.g.isIMEnable = cmp_im.toggle()
    end)

    vim.g.mapx.nnoremap("<a-;>", function()
      vim.g.isIMEnable = cmp_im.toggle()
    end)

    require("nvim-autopairs").setup({})
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api
            .nvim_buf_get_lines(0, line - 1, line, true)[1]
            :sub(col, col)
            :match("%s")
          == nil
    end

    cmp.setup({
      enabled = function()
        -- disable completion in comments
        local context = require("cmp.config.context")
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment") -- comment
              and not context.in_syntax_group("Comment") -- comment
            or vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" -- prompt
            or require("cmp_dap").is_dap_buffer() -- dap buffer
        end
      end,
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "path" },
        { name = "nerdfont" },
        { name = "treesitter" },
        { name = "IM" },
        {
          name = "luasnip",
          option = { show_autosnippets = true },
        },
        { name = "crates" },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            })
          else
            fallback()
          end
        end, { "i", "c" }),

        ["<esc>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
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

        ["<C-[>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ["<C-]>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        ["<Space>"] = cmp.mapping(cmp_im.select(), { "i" }),
        ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
          col_offset = -3,
          side_padding = 0,
          border = "rounded",
          scrollbar = "║",
        },
        documentation = nil,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.menu = vim_item.kind
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
          return require("lspkind").cmp_format({ with_text = false })(
            entry,
            vim_item
          )
        end,
      },
      sorting = {
        comparators = {

          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          require("cmp-under-comparator").under,
          require("clangd_extensions.cmp_scores"),
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
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
    })

    cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
      sources = {
        { name = "dap" },
      },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
