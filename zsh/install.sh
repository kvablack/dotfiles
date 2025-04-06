#!/bin/bash

DOTFILES_DIR=$HOME/.kevin-dotfiles

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/kvablack/dotfiles $DOTFILES_DIR
fi

sh -c "RUNZSH=no; $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s $DOTFILES_DIR/zsh/.zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/zsh/.p10k.zsh $HOME/.p10k.zsh

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    zsh -lic 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'
fi
