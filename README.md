

# My Neovim Configs

![Dashboard](./static/dashboard.png)
![lsp](./static/lsp.png)


</div>

## ✨ Features

- 🚀 Blazingly fast.
- 💤 Easily add plugins with [lazy.nvim](https://github.com/folke/lazy.nvim)

## ⚡️Requirements
Require Neovim >= v0.9.0
A c complier for `treesitter`

## [Keymap](./KEYMAP.md "Plugins")

## File structure
- `core`
    - `autocmd`: Set autocmds
    - `neovide`: Neovide-specificed options
    - `options`: basic options
    - `plugins`: add plugins
    - `utils`: utility functions
- `plugins`
    - `theme`: theme
    - `dashboard`: Welcome screen
    - `ui`: Modify Neovim built-in UI
    - `qol`: Some improvement
    - `editing`: Editing utilities
    - `editor`: Add new features which usually interact with a custom window
    - `statusline`: statusline
    - `lsp`: Language Server Protocol
    - `cmp`: Auto-completion
    - `hydra`: Custom submodes and menus (like Emacs hydra)
    - `dap`: Debug Adapter Protocol
