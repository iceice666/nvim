return {
  {
    "VimLeavePre",
    function()
      pcall(vim.cmd, "UndotreeHide")
      pcall(vim.cmd, "NeoTreeClose")
      pcall(vim.cmd, "TroubleClose")
      pcall(vim.cmd, "lua require 'dapui'.close()")
      pcall(vim.cmd, "SessionSave")
    end,
    description = "Close certain buffer before leave",
  },
  {
    "TextYankPost",
    function()
      vim.highlight.on_yank({
        higroup = "IncSearch",
        timeout = 300,
      })

      if vim.fn.has("wsl") == 1 then
        vim.fn.system("clip.exe", vim.fn.getreg("\""))
      end
    end,

    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
  },
}
