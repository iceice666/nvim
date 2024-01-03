return {
  -- TODO: change the way to add keybinding

  -- windows shifting
  "sindrets/winshift.nvim",
  event = "WinEnter",
  config = function()
    require("winshift").setup({
      keymaps = {
        disable_defaults = true,
      },
    })

    local mapx = vim.g.mapx

    mapx.group({ silent = true }, function()
      mapx.nnoremap("<c-l>", "<cmd>WinShift right<cr>")
      mapx.nnoremap("<c-h>", "<cmd>WinShift left<cr>")
      mapx.nnoremap("<c-j>", "<cmd>WinShift down<cr>")
      mapx.nnoremap("<c-k>", "<cmd>WinShift up<cr> ")
    end)
  end,
}
