#!/bin/bash

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)

# curl -sS https://starship.rs/install.sh | sh


# sudo lchsh $USER # /bin/zsh


# Create a symbolic link from ~/.dotfiles to ~/.zshrc
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/.config/kitty ~/.config
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.config/nvim ~/.config
