vim.g.mapleader = " "

local km = vim.keymap
local opt = { noremap = true, silent = true }

local _set = function(modes, keybindings, operations)
  if type(keybindings) == "table" then
    for _, k in ipairs(keybindings) do
      km.set(modes, k, operations, opt)
    end
  else
    km.set(modes, keybindings, operations, opt)

  end
end

-- undo & redo
_set({ "n", "v", "i" }, "<s-ScrollWheelUp>", "<cmd>:later<cr>")
_set({ "n", "v", "i" }, "<s-ScrollWheelDown>", "<cmd>:earlier<cr>")
_set("n", "U", "<cmd>:later<cr>")

-- Select all
_set({ "n", "v" }, "<c-a>", "gg<s-v>G")

-- Window split
_set("n", "Wl", "<cmd>:set splitright<CR>:vsplit<CR>")
_set("n", "Wh", "<cmd>:set nosplitright<CR>:vsplit<CR>")
_set("n", "Wk", "<cmd>:set nosplitbelow<CR>:split<CR>")
_set("n", "Wj", "<cmd>:set splitbelow<CR>:split<CR>")

-- Cursor jumping
_set("n", "L", "$")
_set("n", "H", "^")
_set("n", "J", "9j")
_set("n", "K", "9k")

-- File
_set("n", "<leader>w", "<cmd>:w<cr>")

-- nohls
_set("n", "<leader>/", "<cmd>:nohls<cr>")

-- Quit
_set("n", "<leader>Q", "<cmd>:qa<cr>")

-- Clean cmdline
_set("n", "<leader><leader>", "<cmd>:echo ' '<cr>")

-- ======================= PLUGINS MAPPINGS ===========================
-- Dashboard
_set("n", "<leader>d", "<cmd>:Alpha<cr>")

-- File tree
_set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Undo tree
_set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Alternate toggler
_set("n", "<leader>ta", "<cmd>:ToggleAlternate<cr>")

-- format
_set("n", "<leader>f", "<cmd>:lua vim.lsp.buf.format({ bufnr = bufnr })<cr>")

-- LazyGit
_set("n", "<leader>lg", "<cmd>:LazyGit<cr>")

-- bufferline
_set("n", "<leader>1", "<cmd>:BufferLineGoToBuffer 1<cr>")
_set("n", "<leader>2", "<cmd>:BufferLineGoToBuffer 2<cr>")
_set("n", "<leader>3", "<cmd>:BufferLineGoToBuffer 3<cr>")
_set("n", "<leader>4", "<cmd>:BufferLineGoToBuffer 4<cr>")
_set("n", "<leader>5", "<cmd>:BufferLineGoToBuffer 5<cr>")
_set("n", "<leader>6", "<cmd>:BufferLineGoToBuffer 6<cr>")
_set("n", "<leader>7", "<cmd>:BufferLineGoToBuffer 7<cr>")
_set("n", "<leader>8", "<cmd>:BufferLineGoToBuffer 8<cr>")
_set("n", "<leader>9", "<cmd>:BufferLineGoToBuffer 9<cr>")

-- buffer close
_set("n", { "<leader>bc", "<leader>q" }, "<cmd>:bdelete %<cr>")
_set("n", "<leader>bp", "<cmd>:BufferLinePickClose<cr>")
_set("n", "<leader>bo", "<cmd>:BufferLineCloseLeft<cr><cmd>:BufferLineCloseRight<cr>")

return {
  _set = _set,
}
