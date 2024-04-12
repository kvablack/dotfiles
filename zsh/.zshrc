# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/home/black/.oh-my-zsh

export SUDO_EDITOR=/usr/bin/vim

export ZSH_THEME="powerlevel10k/powerlevel10k"

unsetopt auto_cd
unsetopt correct
unsetopt correct_all
ENABLE_CORRECTION="false"
setopt hist_ignore_dups
setopt extended_glob

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found vi-mode history-substring-search sudo)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/keyfiles"

autoload -U edit-command-line
zle -N edit-command-line

bindkey '^E' edit-command-line
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey '^F' fzf-cd-from-home
bindkey '^S' sudo-command-line

export KEYTIMEOUT=1

alias sudo="sudo "

alias la="ls -a"
alias ll="ls -l"
alias lal="ls -la"
alias lla="ls -la"

alias vi="vim"

alias brc="/home/black/dotfiles/brc/brc.sh"

alias v3ssh="gcloud compute tpus tpu-vm ssh --zone us-central1-a"
alias v4ssh="gcloud compute tpus tpu-vm ssh --zone us-central2-b"
alias v5ssh="gcloud compute tpus tpu-vm ssh --zone europe-west4-b"

alias gpu="gpustat -i 0.2"

function pdb() {
    PYDEVD_WARN_SLOW_RESOLVE_TIMEOUT=10 python -m debugpy --wait-for-client --listen 5678 $@
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
