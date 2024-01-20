
# keymap [WIP]
[TOC]

leader key is `<space>`

`x` means a `x` key  
`<C-x>` means `CTRL + x`  
`<M-x>` means `ALT + x`  
`<C-M-S-x>` means `CTRL + ALT + SHIFT + x`
`X` ( a uppercase ) means `SHIFT + x`  
`z/x/c/v` means `z` or `x` or `c` or `v`

## Motion

| Keybinding | Mode | Description |
|------------|------|-------------|
| `jk`              | `i` | `<ESC>` in insert mode|
| `<M-h/j/k/l>`     | `i` | `h`/`j`/`k`/`l` move in insert mode |
| `L`               | `n` | Equals `$` |
| `H`               | `n` | Equals `^` |
| `n` & `N`         | `n` `x` `o` | [saner behavior of n and N](https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n) |
| `<leader><tab>`   | `n` | Equals `<c-w>w` |
| `<leader><s-tab>` | `n` | Equals `<c-w>W` |
| `<C-a>`           | `n` | Select all |
| `<C-k>`           | `v` | Move current line or selected text up |
| `<C-j>`           | `v` | Move current line or selected text down |

- [flash.nvim](https://github.com/folke/flash.nvim#-usage)

## Editing
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>q`   | `n` | Quit current buffer |
| `<leader>Q`   | `n` | Force quit all (`:qa!`) |
| `<ldeader>rr` | `n` | Quit with code 1 ([Useful for restart](https://github.com/iceice666/dotfiles/blob/main/.zshrc#L13:L21)) |
| `<leader>w`   | `n` | Write |
| `<leader>/`   | `n` | [saner ctrl+l](https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n) |
| `<leader>!`   | `n` | Reverse `True` `False`, `yes` `no`, `1` `0`, ... etc.
| `U`           | `n` | Redo ( equals `<c-r>`) |
| `dd`          | `n` | Doesn't yank an empty line into default register |
| `i`           | `n` | Indent properly on empty lines |
| `o`           | `n` | In json-like structure, append a comma at the EOL when adding a new line |

- [nvim-surround](https://github.com/kylechui/nvim-surround)

<!-- TODO: surround operation -->

## Buffers

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>e` | `n` | Open file tree |

Press `<leader>b` to get more information


## [Telescope](https://github.com/nvim-telescope/telescope.nvim)

Press `<leader>t` to get more information

## LSP

Press `<leader>l` to get more information

## DAP

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<F5>` | `n` | Start debuging |
| `<S-F5>` | `n` | Rerun debuging |
| `<C-F5>` | `n` | Stop debuging |
| `<F6>` | `n` | Toggle debug UI |
| `<F7>` | `n` | Run to cursor |
| `<F9>` | `n` | Toggle breakpoint |
| `<F10>` | `n` | Step over |
| `<F11>` | `n` | Step into |
| `<F12>` | `n` | Step out |
