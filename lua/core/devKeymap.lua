local mapx = vim.g.mapx

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
end, "Print activated null-ls cilents")
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

mapx.nnoremap("<F12>", function()
  local function tprint(tbl, indent)
    if not indent then
      indent = 0
    end
    for k, v in pairs(tbl) do
      local formatting = string.rep("  ", indent) .. k .. ": "
      if type(v) == "table" then
        print(formatting)
        tprint(v, indent + 1)
      elseif type(v) == "boolean" then
        print(formatting .. tostring(v))
      else
        print(formatting .. v)
      end
    end
  end

  tprint(require("tokyonight.colors").night, 2)
end)
