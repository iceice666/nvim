#!/bin/sh

sudo pacman -S git make gcc ripgrep fd npm lolcat
yay -S neovim-nightly-bin

cd ~/.config
git clone https://github.com/iceice666/nvim.git

cd -

nvim
