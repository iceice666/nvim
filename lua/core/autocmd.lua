local user_autocmd = vim.api.nvim_create_augroup("UserAutoCmd", { clear = true })

-- Open help file in a individual window
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = user_autocmd,
  callback = function(event)
    if vim.bo[event.buf].filetype == "help" then
      vim.bo[event.buf].buflisted = true
      vim.cmd.only()
    end
  end,
})


-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  group = user_autocmd,
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})


-- auto save
vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold" }, {
  pattern = "*",
  group = user_autocmd,
  desc = 'Auto save when leaving insert mode or doesnt press a key for a long time',
  callback = function()
    if vim.fn.filewritable(vim.fn.expand("%")) == 1 or
        vim.fn.findfile(vim.fn.expand("%:t"), vim.fn.expand("%:h")) == 0 then
      vim.cmd("w")
    end
  end
})

-- update when focus gained
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  group = user_autocmd,
  desc = 'Update when focus gained',
  callback = function()
    vim.cmd("checktime")
  end
})
