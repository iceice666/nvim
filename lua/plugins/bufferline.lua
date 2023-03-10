return {
  -- Window tabs
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "BufAdd",
  config = function()
    local clock_table = {
      ["Mon"] = "(一)",
      ["Tue"] = "(二)",
      ["Wed"] = "(三)",
      ["Thu"] = "(四)",
      ["Fri"] = "(五)",
      ["Sat"] = "(六)",
      ["Sun"] = "(日)",
    }

    --
    -- local clock_table = {
    --     ["Mon"] = "",
    --     ["Tue"] = "",
    --     ["Wed"] = "",
    --     ["Thu"] = "",
    --     ["Fri"] = "",
    --     ["Sat"] = "",
    --     ["Sun"] = "",
    -- }

    local get_time = function()
      local date = vim.fn.strftime("%m/%d")
      local week = clock_table[vim.fn.strftime("%a")]
      local time = vim.fn.strftime("%H:%M:%S")

      return { text = " " .. date .. " " .. week .. " " .. time .. " " }
    end

    require("bufferline").setup({
      options = {

        custom_areas = {
          right = function()
            local result = {}

            result[#result + 1] = get_time()

            return result
          end,
        },
        modified_icon = "●",
        indicator = {
          style = "icon",
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
            text_align = "center",
          },
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
      mapx.nnoremap(
        "<leader>[",
        "<cmd>BufferLineCyclePrev<cr>",
        "Buf: Switch to prev buffer"
      )
      mapx.nnoremap(
        "<leader>]",
        "<cmd>BufferLineCycleNext<cr>",
        "Buf: Switch to next buffer"
      )
      mapx.nnoremap(
        "<leader>1",
        "<cmd>BufferLineGoToBuffer 1<CR>",
        "Buf: Switch to buffer1"
      )
      mapx.nnoremap(
        "<leader>2",
        "<cmd>BufferLineGoToBuffer 2<CR>",
        "Buf: Switch to buffer2"
      )
      mapx.nnoremap(
        "<leader>3",
        "<cmd>BufferLineGoToBuffer 3<CR>",
        "Buf: Switch to buffer3"
      )
      mapx.nnoremap(
        "<leader>4",
        "<cmd>BufferLineGoToBuffer 4<CR>",
        "Buf: Switch to buffer4"
      )
      mapx.nnoremap(
        "<leader>5",
        "<cmd>BufferLineGoToBuffer 5<CR>",
        "Buf: Switch to buffer5"
      )
      mapx.nnoremap(
        "<leader>6",
        "<cmd>BufferLineGoToBuffer 6<CR>",
        "Buf: Switch to buffer6"
      )
      mapx.nnoremap(
        "<leader>7",
        "<cmd>BufferLineGoToBuffer 7<CR>",
        "Buf: Switch to buffer7"
      )
      mapx.nnoremap(
        "<leader>8",
        "<cmd>BufferLineGoToBuffer 8<CR>",
        "Buf: Switch to buffer8"
      )
      mapx.nnoremap(
        "<leader>9",
        "<cmd>BufferLineGoToBuffer 9<CR>",
        "Buf: Switch to buffer9"
      )
      mapx.nnoremap("<leader>q", "<cmd>bd %<cr>", "Buf: Close current buffer")
      mapx.nnoremap(
        "<leader>bo",
        "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>",
        "Buf: Close all except current"
      )
      mapx.nnoremap(
        "<leader>ba",
        "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR><cmd>bd<cr>",
        "Buf: Close all buffers"
      )
      mapx.nnoremap(
        "<leader>bp",
        "<cmd>BufferLinePick<CR>",
        "Buf: Switch to picked one"
      )
      mapx.nnoremap(
        "<leader>bd",
        "<cmd>BufferLinePickClose<CR>",
        "Buf: Close a picked one"
      )
    end)
  end,
}
