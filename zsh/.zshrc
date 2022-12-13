# If you come from bash you might have to change your $PATH.
# Path to your oh-my-zsh installation.
export ZSH=/home/black/.oh-my-zsh

export SUDO_EDITOR=/usr/bin/vim

unsetopt auto_cd
setopt hist_ignore_dups
setopt extended_glob

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git command-not-found vi-mode history-substring-search sudo virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/keyfiles"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#bindkey -v
#

bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey '^F' fzf-cd-from-home
bindkey '^S' sudo-command-line

export KEYTIMEOUT=1

if [ -n "$INSIDE_EMACS" ]; then
    export EDITOR=emacsclient
    unset zle_bracketed_paste
fi

alias sudo="sudo "

alias la="ls -a"
alias ll="ls -l"
alias lal="ls -la"
alias lla="ls -la"

alias vi="vim"

alias brc="/home/black/dotfiles/brc/brc.sh"

function pdb() {
    python -m debugpy --wait-for-client --listen 5678 $@
}

# activate python venv alias
activate () { source $*/bin/activate }


### CUSTOM THEME (BASED ON BIRA) ###

# force prompt to reset on keymap change
function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
fi

function conda_prompt_info(){
  [[ -n ${CONDA_DEFAULT_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX=[}$(basename $CONDA_DEFAULT_ENV)${ZSH_THEME_VIRTUALENV_SUFFIX=]}"
}

local symbol_color='${${KEYMAP/vicmd/"%{$fg[red]%}"}/main/}'

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local venv_prompt='$(virtualenv_prompt_info)'
local conda_prompt='$(conda_prompt_info)'


PROMPT="╭─${venv_prompt}${conda_prompt}${user_host} ${current_dir} ${git_branch}
╰─%B${symbol_color}$%{$reset_color%}%b "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUALENV_SUFFIX="›%{$reset_color%} "
RPS1=""
