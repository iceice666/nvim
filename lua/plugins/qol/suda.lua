return {
  "lambdalisue/vim-suda",
  event = "VeryLazy",
  config = function()
    vim.cmd [[
    let g:suda_smart_edit = 1
    let g:suda#prompt = 'The secret to the Deep Dark Fantasy: '
    ]]
  end
}

