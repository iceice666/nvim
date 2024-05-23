return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          layout = {
            position = "right",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 100,
          keymap = {
            accept = false,
            accept_word = "<M-w>",
            accept_line = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<M-d>",
          },
        },
        filetypes = {
          markdown = true,
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
  },
  {
    "jonahgoldwastaken/copilot-status.nvim",
    dependencies = { "zbirenbaum/copilot.lua" },
    lazy = true,
    event = "BufReadPost",
    opts = {
      icons = {
        idle = "󰍶 ",
        error = " ",
        offline = " ",
        warning = "󰀨 ",
        loading = "󱍷 ",
      },
      debug = false,
    },
  },
}
