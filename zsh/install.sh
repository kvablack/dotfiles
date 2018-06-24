#!/bin/bash

git clone --no-checkout https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh/.oh-my-zsh.tmp 

mv .oh-my-zsh/.oh-my-zsh.tmp/.git .oh-my-zsh/

rmdir .oh-my-zsh/.oh-my-zsh.tmp 
cd .oh-my-zsh

git reset --hard HEAD
