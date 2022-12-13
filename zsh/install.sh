#!/bin/bash

sh -c "RUNZSH=no; $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~
rm -f ~/.zshrc
ln -s dotfiles/zsh/.zshrc .zshrc
