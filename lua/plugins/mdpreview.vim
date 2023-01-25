function! Open(url)
  call system('/usr/bin/microsoft-edge-stable --new-window ' . a:url)
endfunction

let g:mkdp_filetypes = [ "markdown" ]
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = 'Open'
let g:mkdp_page_title = '${name}'
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 0
