local mapx = require("core.keymap").mapx

mapx.nnoremap("<F2>", "<cmd>lua print(vim.bo.filetype)<cr>", "Print filetype")
mapx.nnoremap("<F3>", "<cmd>lua print(vim.fn.mode())<cr>", "Print current mode")
mapx.nnoremap("<F4>", function()
  local sources = require("null-ls").get_sources()
  local s = ""
  local ft = vim.bo.filetype
  for _, v in pairs(sources) do
    if v.filetypes[ft] == true then
      s = s .. v.name .. " "
    end
  end
  print(s)
end, "Print current mode")
