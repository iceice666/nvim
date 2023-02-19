return {
  -- searchbox
  "VonHeikemen/searchbox.nvim",
  config = function()
    local mapx = require("core.keymap").mapx

    vim.cmd("highlight Search gui=nocombine guibg=#a55b86")

    require 'searchbox'.setup {}


    mapx.group({ silent = true }, function()
      mapx.nnoremap("/", "<cmd>SearchBoxMatchAll show_matches=true title=' Match all' <cr>")
      mapx.nnoremap("?", "<cmd>SearchBoxReplace confirm=menu show_matches=true title=' Replce'  <cr>")

      mapx.vnoremap("/", "<cmd>SearchBoxMatchAll visual_mode=true show_matches=true title=' Match all'  <cr>")
      mapx.vnoremap("?", "<cmd>SearchBoxReplace visual_mode=true confirm=menu show_matches=true title=' Replce'  <cr>")
    end)
  end
}
