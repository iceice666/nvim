return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_auto_close = 0

    vim.cmd([[
        function OpenMarkdownPreview (url)
          execute "silent ! firefox --new-window " . a:url
        endfunction
        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
      ]])
  end,
  ft = { "markdown" },
}
