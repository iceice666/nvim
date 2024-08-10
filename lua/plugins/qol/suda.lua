return {
  "lambdalisue/vim-suda",
  cond = 1 ~= vim.g.vscode,
  event = "VeryLazy",
  config = function()
    vim.cmd [[
    let g:suda_smart_edit = 1
    let g:suda#prompt = 'The secret to the Deep Dark Fantasy: '
    ]]
  end
}
