# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
fi

MODE_INDICATOR='foo'
local symbol_color='${$(vi_mode_prompt_info)/foo/"%{$fg[red]%}"}'

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local venv_prompt='$(virtualenv_prompt_info)'

PROMPT="╭─${venv_prompt} ${user_host} ${current_dir} ${git_branch}
╰─%B${symbol_color}$%{$reset_color%}%b "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUALENV_SUFFIX="›%{$reset_color%}"
RPS1=""
