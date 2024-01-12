local feed_keys = function(keys, mode)
  if keys == nil then
    return
  end

  mode = mode or "n"
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(keys, true, false, true),
    mode,
    false
  )
end

-- ==============================================
--         Keymap defined here
-- ==============================================

return {
  "folke/which-key.nvim",
  lazy = false,
  priority = 10000,
  config = function()
    local wk = require("which-key")
    wk.setup()
  end,
  keys = {
    {
      -- esc in insert mode
      "jk",
      "<ESC>",
      mode = { "i" },
      desc = "Escape",
    },

    -- Quit
    {
      "<leader>Q",
      function()
        vim.cmd("qa!")
      end,
      desc = "Quit Neovim",
    },

    -- restart / exit with code 1
    {
      "<leader>rr",
      function()
        vim.cmd("cq!")
      end,
      desc = "Reload Neovim",
    },

    -- write
    { "<leader>w", "<cmd>w<cr>", desc = "Buf: Write" },

    -- Move selected sections
    -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L32
    {
      "<c-k>",
      ":m '<-2<cr>gv=gv",
      desc = "Move up",
      mode = { "v" },
    },
    {
      "<c-j>",
      ":m '>+1<cr>gv=gv",
      desc = "Move down",
      mode = { "v" },
    },

    -- redo
    { "U", "<C-R>", desc = "Redo" },

    -- Select all
    { "<c-a>", "ggVG", desc = "Select all", mode = { "n", "v" } },

    -- Cursor jumping

    { "L", "$" },
    { "H", "^" },

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    {
      "n",
      "'Nn'[v:searchforward]",
      desc = "Next search result",
      expr = true,
      mode = { "n", "x", "o" },
    },
    {
      "N",
      "'nN'[v:searchforward]",
      desc = "Prev search result",
      expr = true,
      mode = { "n", "x", "o" },
    },

    -- https://github.com/mhinz/vim-galore#saner-ctrl-l
    {
      "<leader>/",
      "<cmd>nohlsearch<cr><cmd>diffupdate<cr><cmd>syntax sync fromstart<cr><c-l>",
      desc = "Buf: Redraw",
    },

    { "<m-h>", "<Left>", mode = "i" },
    { "<m-j>", "<Down>", mode = "i" },
    { "<m-k>", "<Up>", mode = "i" },
    { "<m-l>", "<Right>", mode = "i" },

    { "<m-tab>", "<c-w>w" },
    { "<m-s-tab>", "<c-w>W" },

    -- Open url
    -- https://www.google.com
    {
      "<leader>x",
      function()
        local word = vim.fn.expand("<cfile>")
        local search_url = "https://www.google.com/search?q="
        local browser = "firefox"

        local url = (function()
          if
            vim.startswith(word, "http://") or vim.startswith(word, "https://")
          then
            return word
          else
            return search_url .. word
          end
        end)()

        local cmd = (function()
          if vim.fn.has("wsl") == 1 then
            return {
              "powershell.exe",
              "[system.Diagnostics.Process]::Start(\""
                .. browser
                .. "\",\""
                .. url
                .. "\")",
            }
          else
            return { "xdg-open", url }
          end
        end)()

        vim.fn.jobstart(cmd, { detach = true })
      end,
      desc = "Search with browser",
    },

    -- An expression mapping for dd that doesn't yank an empty line into your default register
    {
      "dd",
      function()
        if vim.api.nvim_get_current_line():match("^%s*$") then
          feed_keys("\"_dd")
        else
          feed_keys("dd")
        end
      end,
    },

    --An expression mapping for i that will indent properly on empty lines
    {
      "i",
      function()
        if #vim.fn.getline(".") == 0 then
          feed_keys("\"_cc")
        else
          feed_keys("i")
        end
      end,
    },

    --  in json-like structure, that will auto append a comma at the EOL when adding a new line
    {
      "o",
      function()
        local line = vim.api.nvim_get_current_line()

        if vim.bo.filetype == "json" and string.find(line, "[^,{[]$") then
          feed_keys("A,<CR>")
        else
          feed_keys("o")
        end
      end,
    },
  },
}
