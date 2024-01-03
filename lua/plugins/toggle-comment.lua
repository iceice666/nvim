return {
  -- TODO: change the way to add keybinding

  -- Toggle comment
  "numToStr/Comment.nvim",
  event = "BufReadPost",
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = nil,
      mappings = {
        basic = false,
        extra = false,
      },
    })
    local mapx = vim.g.mapx
    local api = require("Comment.api")
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    mapx.group({ silent = true }, function()
      mapx.nnoremap(
        "<C-\\>",
        api.toggle.linewise.current,
        "Comment: line comment"
      )
      mapx.nnoremap(
        "<A-\\>",
        api.toggle.blockwise.current,
        "Comment: block comment"
      )
      mapx.vnoremap("<C-\\>", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
      end, "Comment: line comment")

      mapx.vnoremap("<A-\\>", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.blockwise(vim.fn.visualmode())
      end, "Comment: block comment")
    end)
  end,
}
