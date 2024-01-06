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

          if has("win32")
            call system(['powershell.exe','start' , a:url])
          elseif has("unix")
            let s:uname = system("uname")
            if s:uname == "Darwin\n"
              "Mac options here
          
            elseif s:uname == "Linux\n"
             execute "silent ! firefox --new-window " . a:url
            endif
          endif
        endfunction

        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
      ]])
  end,
  ft = { "markdown" },
}
