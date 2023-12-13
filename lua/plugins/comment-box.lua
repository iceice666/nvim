return {
  -- Comment box
  "LudoPinelli/comment-box.nvim",
  event = "BufReadPost",
  config = function()
    require("comment-box").setup({
      doc_width = 60, -- width of the document
      box_width = 60, -- width of the documentf the boxes
      borders = {  -- symbols usef the documentd to draw a box
        top = "─",
        bottom = "─",
        left = "│",
        right = "│",
        top_left = "╭",
        top_right = "╮",
        bottom_left = "╰",
        bottom_right = "╯",
      },
      line_width = 60, -- width f the documentof the lines
      line = {      -- symbols used tf the documento draw a line
        line = "─",
        line_start = "─",
        line_end = "─",
      },
      outer_blank_lines = false,  -- insert a blank line above and below the box
      inner_blank_lines = false,  -- insert a blank line above and below the text
      line_blank_line_above = false, -- insert a blank line above the line
      line_blank_line_below = false, -- insert a blank line below the line
    })

    local mapx = vim.g.mapx

    mapx.group({ silent = true }, function()
      mapx.vnoremap("<leader>bc", "<cmd>CBccbox<cr>")
    end)
  end,
}
