deploy:
  #!/usr/bin/env bash

  sudo pacman -S --needed make gcc ripgrep fd npm  tree-sitter unzip


  # required libs, modules, etc...
  pnpm install -g prettier_d_slim


  nvim


