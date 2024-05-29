
# keymap [WIP]
[TOC]

leader key is `<space>`

`x` means a `x` key  
`<C-x>` means `CTRL + x`  
`<M-x>` means `ALT + x`  
`<C-M-S-x>` means `CTRL + ALT + SHIFT + x`  
`X` ( a uppercase ) means `SHIFT + x`  
`z/x/c/v` means `z` or `x` or `c` or `v`


> To check some keybindings which not included in this doc,  
each plugin file has a `keys` section which contains the keybindins of this plugin.

## Motion

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<M-h/j/k/l>`     | `i` | `h`/`j`/`k`/`l` move in insert mode |
| `L`               | `n` | Equals `$` |
| `H`               | `n` | Equals `^` |
| `n` & `N`         | `n` `x` `o` | [saner behavior of n and N](https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n) |
| `<C-a>`           | `n` | Select all |
| `<C-k>`           | `v` | Move current line or selected text up |
| `<C-j>`           | `v` | Move current line or selected text down |

- [flash.nvim](https://github.com/folke/flash.nvim#-usage)

## Editing
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>q`   | `n` | Quit current buffer |
| `<leader>Q`   | `n` | Force quit all (`:qa!`) |
| `<leader>w`   | `n` | Write |
| `<leader>/`   | `n` | redraw screen, de-highlighting search, diff update, syntax sync and clear notification (ref: [saner ctrl+l](https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n)) |
| `<leader>~`   | `n` | Reverse `True` `False`, `yes` `no`, `1` `0`, ... etc.
| `U`           | `n` | Redo ( equals `<c-r>`) |
| `i` & `a`     | `n` | Now `i`/`a` can add indents properly on empty lines |
| `o`           | `n` | In json-like structure, append a comma at the EOL when adding a new line |
| `<C-\>`       | `n` `v` | Toggle line comment |
| `<M-\>`       | `n` `v` | Toggle block comment |

- [nvim-surround](https://github.com/kylechui/nvim-surround)

<!-- TODO: surround operation -->

## Buffers

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>e` | `n` | Open file tree |

Press `<leader>b` to get more information

## Windows

Press `<c-w>` to get more information


## [Telescope](https://github.com/nvim-telescope/telescope.nvim)

Press `<leader>t` to get more information

## [ Macro ](https://github.com/ecthelionvi/NeoComposer.nvim)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `qq`       | `n`  | Start recording a macro |
| `Q`        | `n`  | Play a macro |
| `<c-q>`    | `n`  | Macro manager |
| `cq`       | `n`  | Stop a macro |
| `q<c-n>`   | `n`  | Switch to next macro |
| `q<c-p>`   | `n`  | Switch to prev macro |

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
