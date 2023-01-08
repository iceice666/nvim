require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",

    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
      {
        filetype = "undotree",
        text = "Undo History",
        hightlight = "Directory",
        text_align = "left",
      },
    },
  },
})
