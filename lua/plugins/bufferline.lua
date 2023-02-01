require("bufferline").setup({
  options = {
    custom_areas = {
      right = function()
        local result = {
          {
            text = vim.fn.strftime("%m/%y %H:%M:%S")
          },
          {
            text = "  "
          }
        }
        return result
      end
    },
    modified_icon = "●",
    indicator = {
      style = 'icon'
    },

    mode = "buffer",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
            or (e == "warning" and " " or " ")
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center",
      },
      {
        filetype = "undotree",
        text = "Undo History",
        hightlight = "Directory",
        text_align = "center",
      },
      {
        filetype = "lspsagaoutline",
        text = "Objects",
        hightlight = "Directory",
        text_align = "center"
      }
    },
    highlights = {
      fill = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      background = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLine" },
      },
      buffer_visible = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      buffer_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      separator = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLine" },
      },
      separator_selected = {
        fg = { attribute = "fg", highlight = "Special" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      separator_visible = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      close_button = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLine" },
      },
      close_button_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      close_button_visible = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
    },
  },
})
local mapx = require("core.keymap").mapx
mapx.group({ silent = true }, function()

  mapx.nnoremap("<leader>[", "<cmd>BufferLineCyclePrev<cr>", "Buf: Switch to prev buffer")
  mapx.nnoremap("<leader>]", "<cmd>BufferLineCycleNext<cr>", "Buf: Switch to next buffer")
  mapx.nnoremap("<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", "Buf: Switch to buffer1")
  mapx.nnoremap("<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", "Buf: Switch to buffer2")
  mapx.nnoremap("<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", "Buf: Switch to buffer3")
  mapx.nnoremap("<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", "Buf: Switch to buffer4")
  mapx.nnoremap("<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", "Buf: Switch to buffer5")
  mapx.nnoremap("<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", "Buf: Switch to buffer6")
  mapx.nnoremap("<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", "Buf: Switch to buffer7")
  mapx.nnoremap("<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", "Buf: Switch to buffer8")
  mapx.nnoremap("<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", "Buf: Switch to buffer9")
  mapx.nnoremap("<leader>q", "<cmd>bd %<cr>", "Buf: Close current buffer")
  mapx.nnoremap("<leader>bo", "<cmd>BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", "Buf: Close all except current")
  mapx.nnoremap("<leader>bp", "<cmd>BufferLinePick<CR>", "Buf: Switch to picked one")
  mapx.nnoremap("<leader>bd", "<cmd>BufferLinePickClose<CR>", "Buf: Close a picked one")



end)
