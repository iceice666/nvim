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

local open_under_cursor = function()
  local function gen_url(search_url, word)
    if
        vim.startswith(word, "http://") or vim.startswith(word, "https://")
    then
      return word
    else
      return search_url .. word
    end
  end

  local function gen_cmd(browser, url)
    if vim.fn.has("wsl") == 1 then
      return {
        "powershell.exe",
        "[system.Diagnostics.Process]::Start(\""
        .. browser
        .. "\",\""
        .. url
        .. "\")",
      }
    elseif vim.fn.system("uname") == "Darwin\n" then
      return { "open", "-u", url }
    else
      return { "xdg-open", url }
    end
  end

  local word = vim.fn.expand("<cfile>")
  local search_url = "https://www.google.com/search?q="
  local browser = "firefox"


  vim.fn.jobstart(gen_cmd(browser, gen_url(search_url, word)), { detach = true })
end



-- ==============================================
-- ref: https://github.com/folke/which-key.nvim/blob/main/lua/which-key/extras.lua

local function bufs()
  return vim.list_slice(vim.tbl_filter(function(buf)
    return vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs()), 1, 9)
end

local function bufname(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  return name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":~:.")
end

local function expand_buf()
  local ret = {}

  for _, buf in ipairs(bufs()) do
    local name = bufname(buf)
    ret[#ret + 1] = {
      tostring(#ret + 1),
      function()
        vim.api.nvim_set_current_buf(buf)
      end,
      desc = name,
      icon = { cat = "file", name = name },
    }
  end
  return ret
end
-- ==============================================


-- ==============================================
--         Keymap defined here
-- ==============================================
local km = {
  -- Quit
  {
    "<leader>Q",
    function()
      vim.cmd("qa!")
    end,
    desc = "Quit Neovim",
  },

  -- buf delete
  {
    "<leader>q",
    function()
      vim.cmd("bd")
    end,
    desc = "Buffer: Delete",
  },

  -- write
  { "<leader>w", "<cmd>w<cr>",     desc = "Buffer: Write" },

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

  -- Don't lose selection when shifting sidewards
  -- https://github.com/mhinz/vim-galore?tab=readme-ov-file#dont-lose-selection-when-shifting-sidewards
  { ">",         ">gv",            mode = "x" },
  { "<",         "<gv",            mode = "x" },


  { "[b",        "<cmd>bprev<cr>", desc = "Buffer: Previous" },
  { "]b",        "<cmd>bnext<cr>", desc = "Buffer: Next" },

  -- quick scroll
  { "J",         "10j",            mode = { "n", "x", "o" }, desc = "Down 10 lines" },
  { "K",         "10k",            mode = { "n", "x", "o" }, desc = "Up 10 lines" },

  -- redo
  { "U",         "<C-R>",          desc = "Redo" },

  -- Select all
  { "<c-a>",     "ggVG",           desc = "Select all",      mode = { "n", "v" } },

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
    "<cmd>nohlsearch<cr><cmd>diffupdate<cr><cmd>syntax sync fromstart<cr><cmd>NoiceDismiss<CR><c-l>",
    desc = "Buffer: Redraw",
  },

  {
    "<leader>ur",
    ":%s/\r//g<CR>",
    desc = "Remove tailing \\r"
  },

  { "<m-h>", "<Left>",           mode = "i" },
  { "<m-j>", "<Down>",           mode = "i" },
  { "<m-k>", "<Up>",             mode = "i" },
  { "<m-l>", "<Right>",          mode = "i" },

  { "[t",    "<cmd>tabprev<cr>", desc = "Tab: Previous" },
  { "]t",    "<cmd>tabnext<cr>", desc = "Tab: Next" },

  -- Open url
  -- https://www.google.com
  {
    "<leader>X",
    open_under_cursor,
    desc = "Search with browser",
  },
  {
    "<C-X>",
    open_under_cursor,
    desc = "Search with browser",
    mode = "i"
  },

  -- An expression mapping for `dd` that doesn't yank an empty line into your default register
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
  -- Make 'x' key not copy to clipboard when deleting a character.
  {
    "x",
    function()
      if vim.fn.col "." == 1 then
        local line = vim.fn.getline "."
        if line:match "^%s*$" then
          feed_keys('"_dd')
          feed_keys("$")
        else
          feed_keys('"_x')
        end
      else
        feed_keys('"_x')
      end
    end,
    desc = "Delete character without yanking it",
  },
  {
    "x",
    '"_x',
    desc = "Delete all characters in line",
    mode = "x"
  },
  -- Same for shifted X

  {
    "X",
    function()
      if vim.fn.col "." == 1 then
        local line = vim.fn.getline "."
        if line:match "^%s*$" then
          feed_keys('"_dd')
          feed_keys("$")
        else
          feed_keys('"_X')
        end
      else
        feed_keys('"_X')
      end
    end,
    desc = "Delete character without yanking it",
  },
  {
    "X",
    '"_X',
    desc = "Delete all characters in line",
    mode = "x"
  },

  --An expression mapping for `i` & `a` that will indent properly on empty lines
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
  {
    "a",
    function()
      if #vim.fn.getline(".") == 0 then
        feed_keys("\"_cc")
      else
        feed_keys("a")
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
}

-- Which-key specific
local wk_spec = {
  -- buffer navigation
  {
    group = "Buffer",
    { "[b", "<cmd>bprev<cr>", desc = "Buffer: Previous" },
    { "]b", "<cmd>bnext<cr>", desc = "Buffer: Next" },
    {
      "<leader>",
      expand = function()
        return expand_buf()
      end,
    },
  },
}


-- ==============================================
--         Group defined here
-- ==============================================

local group = {
  { "<leader>s", group = "shows", icon = { icon = "" } },
  { "<leader>u", group = "Utils", }
}

local ok, wk = pcall(require, "which-key")
if ok then
  wk.add(km)
  wk.add(group)
else
  vim.g.utils.set_keymap(km)
end
