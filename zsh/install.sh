#!/bin/bash

sh -c "RUNZSH=no; $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~
rm -f ~/.zshrc
ln -s dotfiles/zsh/.zshrc .zshrc
ln -s dotfiles/zsh/.p10k.zsh .p10k.zsh

zsh -lic 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'
