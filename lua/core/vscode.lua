if vim.g.vscode ~= 1 then return end

local vscode = require("vscode")

vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

vim.notify("Load vscode config!")


vim.api.nvim_create_user_command("VscodeAction", function(opts)
  vim.notify(opts.fargs[1])
  vscode.action(opts.fargs[1])
end, { nargs = 1 })

local function action(act)
  return function()
    vscode.action(act)
  end
end


local function toggle_explorer()
  local is_open = vscode.eval([[
  return vscode.ContextKeyExpr.and(
  vscode.ContextKeyExpr.equals('foldersViewVisible', true),
  ).evaluate()
  ]])

  vim.notify(is_open)


  if is_open then
    vscode.action("workbench.action.closeSidebar")
  else
    vscode.action("workbench.view.explorer")
  end
end

-- TODO:
local km = {
  { "<leader>e", toggle_explorer }
}

vim.g.utils.set_keymap(km)
