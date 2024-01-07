
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
| `<leader>E` | `n` | Open file tree |

## [Telescope](https://github.com/nvim-telescope/telescope.nvim)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>tff` | `n` | Find files |
| `<leader>tfg` | `n` | Find git tracked files | 
| `<leader>tfc` | `n` | Find files that contain the current cursor word | 
| `<leader>tfs` | `n` | Find words |
| `<leader>tr`  | `n` | Recent files |
| `<leader>th`  | `n` | Check highlights |
| `<leader>tu`  | `n` | Undo history |

## LSP

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gpd`        | `n`     | **G**oto **P**eek **D**efintion      |
| `gpt`        | `n`     | **G**oto **P**eek **T**ype defintion |
| `gd`         | `n`     | **G**oto **D**efiniton               |
| `gtd`        | `n`     | **G**oto **T**ype **D**efiniton      |
| `gk`         | `n`     | hover doc                            |
| `gK`         | `n`     | Show doc and pinned at top right     |
| `g[`         | `n`     | Goto prev diagnostic                 |
| `g]`         | `n`     | Goto next diagnostic                 |
|
| `<leader>rf` | `n`     | **R**ename in current **f**ile       |
| `<leader>rp` | `n`     | **R**ename in entire **p**roject     |
| `<leader>fr` | `n`     | **F**inder: **R**eferences           |
| `<leader>fd` | `n`     | **F**inder: **D**efinition           |
| `<leader>fi` | `n`     | **F**inder: **I**mplementation       |
| `<leader>inc`| `n`     | Show **inc**oming calls              |
| `<leader>out`| `n`     | Show **out**going calls              |
| `<leader>so` | `n`     | Show **s**ymbol **o**utline          |
| `<leader>ca` | `n` `v` | **C**ode **A**ction                  |

#### Rust

For rust, there has some extra bindings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `g<space>`   | `n` | [Hover range](https://github.com/mrcjkb/rustaceanvim#usage) |
|
| `<leader>ee` | `n` `v` | **E**xplain **e**rror |
| `<leader>em` | `n`     | **E**xpand **m**acro  |
| `<leader>oc` | `n`     | **O**pen `Cargo.toml` |
