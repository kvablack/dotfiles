#!/bin/bash

cd ~
rm .vimrc
ln -s dotfiles/zsh/.vimrc .zshrc
ln -s dotfiles/zsh/.vim .vim
mkdir .vim_undo
