#!/bin/sh

sudo pacman -S git make gcc ripgrep fd npm lolcat tree-sitter unzip
yay -S neovim-nightly-bin


# required libs, modules, etc...
npm install -g prettier_d_slim


nvim


