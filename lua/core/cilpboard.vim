
vstart = getpos("'<")

vend = getpos("'>")

line_start = vstart[2]
line_end = vend[2]


lines = getline(line_start,line_end)


let g:clipboard = {
      \ 'name' = 'myClipboard',
      \ 'copy' = {
      \    '+' = ['lemonade copy'],
      \  },
      \  'paste' = {
      \
      \ },
      \  'cache_enabled' = 1

}
