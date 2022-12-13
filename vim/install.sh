#!/bin/bash

cd ~
rm -f .vimrc
ln -s dotfiles/vim/.vimrc .vimrc
ln -s dotfiles/vim/.vim .vim
mkdir .vim_undo
