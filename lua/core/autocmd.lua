vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    pcall(require("dapui").close, "")
    pcall(vim.api.nvim_exec, "UndotreeHide")
    pcall(vim.api.nvim_exec, "NeoTreeClose")
    pcall(vim.api.nvim_exec, "TroubleClose")

    pcall(vim.api.nvim_exec, "SessionSave")
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(event)
    if vim.bo[event.buf].filetype == "help" then
      vim.bo[event.buf].buflisted = true
      vim.cmd.only()
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(event)
    if vim.bo[event.buf].filetype == "term" then
      vim.bo[event.buf].modifiable = true
    end
  end,
})
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   callback = function()
--     vim.highlight.on_yank({
--       higroup = "IncSearch",
--       timeout = 300,
--     })
--
--     if vim.fn.has("wsl") == 1 then
--       vim.fn.system("clip.exe", vim.fn.getreg("\""))
--     end
--   end,
--
--   group = vim.api.nvim_create_augroup("Yank", { clear = true }),
-- })
