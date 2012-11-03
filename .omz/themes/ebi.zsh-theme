setopt prompt_subst

#autoload -U colors && colors
autoload -Uz vcs_info

# set vcs_info parameters
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'
zstyle ':vcs_info:*' actionformats '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{2}%b%c%u%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%F{3}%r'
zstyle ':vcs_info:*' enable cvs svn hg bzr
#zstyle ':vcs_info:*' nvcsformats '%~' '' #nicoulaj

theme_precmd() {
	vcs_info
	}

# user part, color coded by privileges
local user='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n%{$reset_color%}'
# prompt char, color/char coded by privileges
local pchar='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%#%{$reset_color%}'
# hostname part
local host='@%{$fg_bold[cyan]%}%m%{$reset_color%}'
# compacted $PWD
local pwd='%{$fg[white]%}[%~]%{$reset_color%}'
# local time, color coded by last return code
time1="[%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}]"
time0="[%{$fg[green]%}%*%{$reset_color%}]"
time=$time1
local git_prompt='$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}$(git_prompt_info)%{$reset_color%}$(git_prompt_short_sha)'
local vcs_info='${vcs_info_msg_0_}'

#ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}g:"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}✭"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg_bold[white]%}:"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

PROMPT="${user}${host}${time}${git_prompt}${vcs_info}
${pwd}${pchar}%{$fg[blue]%}→%{$reset_color%} "

return_code1="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code0=
return_code=$return_code1

RPROMPT='${return_code}'

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd

#dieter
function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time0
		return_code=$return_code0
	else
		time=$time1
		return_code=$return_code1
	fi
	zle accept-line
	}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
