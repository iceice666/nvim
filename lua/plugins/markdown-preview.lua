return {
    -- Markdown preview
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.cmd([[
    function! Open(url)
      if has("win32")
        call system(['powershell.exe','start' , a:url])

      elseif has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
          "Mac options here

        elseif s:uname == "Linux\n"
          "Linux options here
        endif
      endif
    endfunction

    let g:mkdp_filetypes = [ "markdown" ]
    let g:mkdp_echo_preview_url = 1
    let g:mkdp_browserfunc = 'Open'
    let g:mkdp_page_title = '${name}'
    let g:mkdp_auto_start = 1
    let g:mkdp_auto_close = 0]])
    end,
}
