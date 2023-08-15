local mapx = vim.g.mapx

mapx.nnoremap("<F2>", "<cmd>lua print(vim.bo.filetype)<cr>", "Print filetype")
mapx.nnoremap("<F3>", "<cmd>lua print(vim.fn.mode())<cr>", "Print current mode")

mapx.nnoremap("<F7>", function()
  local error =
      #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn =
      #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info =
      #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local hint =
      #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  print("error " .. error)
  print("warn " .. warn)
  print("info " .. info)
  print("hint " .. hint)
end)

mapx.nnoremap("<F8>", function()
  local clients = vim.lsp.get_active_clients()
  for _, k in ipairs(clients) do
    print(k.name)
  end
end, "Print activated lsp clients")
