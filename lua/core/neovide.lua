if vim.g.neovide ~= true then return end

vim.notify("Load neovide config!")

vim.o.guifont = "CaskaydiaCove Nerd Font:h14"
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_fullscreen = true
-- I think we are programming not playing video games
-- Does it really worth it to set such high refresh rate???
vim.g.neovide_refresh_rate = 165 -- require `--no-vsync` flag
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_cursor_vfx_mode = "railgun"




local function set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = set_ime,
})
