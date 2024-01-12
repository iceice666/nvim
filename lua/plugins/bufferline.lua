return {
  -- Buffer tabs
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "BufReadPost",
  opts = {
    options = {
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
      },
    },
  },
}
