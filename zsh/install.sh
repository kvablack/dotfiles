#!/bin/bash

sh -c "RUNZSH=no; $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm -f $HOME/.zshrc $HOME/.p10k.zsh
ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    zsh -lic 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'
fi
