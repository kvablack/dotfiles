# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
export SUDO_EDITOR=vim

unsetopt auto_cd
unsetopt correct
unsetopt correct_all
ENABLE_CORRECTION="false"
setopt hist_ignore_dups
setopt extended_glob
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git command-not-found vi-mode sudo history-substring-search)

source $ZSH/oh-my-zsh.sh

autoload -U edit-command-line
zle -N edit-command-line

# KEYBINDS
bindkey '^E' edit-command-line
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey '^S' sudo-command-line
export KEYTIMEOUT=1

# ALIASES
alias vi="vim"

function pdb() {
    PYDEVD_WARN_SLOW_RESOLVE_TIMEOUT=10 python -m debugpy --wait-for-client --listen 5678 $@
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh