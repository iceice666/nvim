return {
  event = "VeryLazy",
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    disabled_filetypes = { "spectre_panel", "noice", "neo-tree", "netrw", "lazy", "mason", "oil" },
    disabled_keys = {
      ["<Up>"] = { "", },
      ["<Down>"] = { "", },
      ["<Left>"] = { "", },
      ["<Right>"] = { "", },
    },
    disable_mouse = true,
    max_count = 5,
    hints = {
      ["[dcyvV][ia][%(%)]"] = {
        message = function(keys)
          return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
        end,
        length = 3,
      },
    },
  }
}
