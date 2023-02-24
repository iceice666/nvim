return {
  -- windows shifting
  "sindrets/winshift.nvim",
  event = "WinEnter",
  config = function()
    require("winshift").setup({
      keymaps = {
        disable_defaults = true,
      },
    })

    local mapx = require("core.keymap").mapx

    mapx.group({ silent = true }, function()
      mapx.nnoremap("<leader><c-l>", "<cmd>WinShift right<cr>")
      mapx.nnoremap("<leader><c-h>", "<cmd>WinShift left<cr>")
      mapx.nnoremap("<leader><c-j>", "<cmd>WinShift down<cr>")
      mapx.nnoremap("<leader><c-k>", "<cmd>WinShift up<cr> ")
    end)
  end,
}
