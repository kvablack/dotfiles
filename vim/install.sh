#!/bin/bash

cd ~
rm .vimrc
ln -s dotfiles/vim/.vimrc .vimrc
ln -s dotfiles/vim/.vim .vim
mkdir .vim_undo
