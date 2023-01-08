vim.g.mapleader = " "

local km = vim.keymap
local opt = { noremap = true, silent = true }

local _set = function(modes, keybindings, operations)
  km.set(modes, keybindings, operations, opt)
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
_set("n", "<leader>q", "<cmd>:x<cr>")
_set("n", "<leader>Q", "<cmd>:q!<cr>")

-- nohls
_set("n", "<leader>/", "<cmd>:nohls<cr>")

-- Clean cmdline
_set("n", "<leader><leader>", "<cmd>:echo ' '<cr>")

-- ======================= PLUGINS MAPPINGS ===========================
-- File tree
_set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Undo tree
_set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Alternate toggler
_set("n", "<leader>ta", "<cmd>:ToggleAlternate<cr>")

-- format
_set("n", "<leader>f", "<cmd>:lua vim.lsp.buf.format({ bufnr = bufnr })<cr>")

return {
  _set = _set,
}
