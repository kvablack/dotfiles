# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:/Users/black/rutils/bin
export ZSH=/Users/black/.oh-my-zsh

export SUDO_EDITOR=/usr/bin/vim

export ZSH_THEME="powerlevel10k/powerlevel10k"

unsetopt auto_cd
unsetopt correct
unsetopt correct_all
ENABLE_CORRECTION="false"
setopt hist_ignore_dups
setopt extended_glob

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git command-not-found vi-mode sudo history-substring-search)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/keyfiles"

autoload -U edit-command-line
zle -N edit-command-line

bindkey '^E' edit-command-line
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey '^S' sudo-command-line

export KEYTIMEOUT=1

alias b="ssh -Y lud -t tmux a -t"

alias la="ls -a"
alias ll="ls -l"
alias lal="ls -la"
alias lla="ls -la"

alias vi="vim"

alias brc="/Users/black/dotfiles/brc/brc.sh"

alias v3ssh="gcloud compute tpus tpu-vm ssh --zone us-central1-a"
alias v4ssh="gcloud compute tpus tpu-vm ssh --zone us-central2-b"
alias v5ssh="gcloud compute tpus tpu-vm ssh --zone europe-west4-b"

alias gpu="gpustat -i 0.2"

function pdb() {
    PYDEVD_WARN_SLOW_RESOLVE_TIMEOUT=10 python -m debugpy --wait-for-client --listen 5678 $@
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/black/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/black/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/black/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/black/google-cloud-sdk/completion.zsh.inc'; fi
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/black/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/black/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/black/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/black/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
