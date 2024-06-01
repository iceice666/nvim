return {
  -- Buffer tabs
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
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
  keys = {
    -- stylua: ignore start
    { "[b",        "<cmd>BufferLineCyclePrev<cr>",    desc = "Buf: Switch to prev buffer", },
    { "]b",        "<cmd>BufferLineCycleNext<cr>",    desc = "Buf: Switch to next buffer", },
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buf: Switch to buffer1", },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Buf: Switch to buffer2", },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Buf: Switch to buffer3", },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Buf: Switch to buffer4", },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "Buf: Switch to buffer5", },
    { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "Buf: Switch to buffer6", },
    { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "Buf: Switch to buffer7", },
    { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", desc = "Buf: Switch to buffer8", },
    { "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", desc = "Buf: Switch to buffer9", },
    {
      "<leader>q",
      function()
        local ok, _ = pcall(vim.cmd, "Bdelete")
        if not ok then
          vim.cmd("bd")
        end
      end,
      desc = "Buf: Close current buffer",
    },
  },
}
