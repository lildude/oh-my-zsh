# ------------------------------------------------------------------------------
#          FILE:  colin.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  Colin Seymour (lildood@gmail.com)
#       VERSION:  1.0
#    SCREENSHOT:  
# ------------------------------------------------------------------------------

function prompt_char {
	git branch >/dev/null 2>/dev/null && echo 'git' && return
	hg root >/dev/null 2>/dev/null && echo 'hg' && return
	echo ''
}


if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
	REPO=$(prompt_char)
	if [ "${REPO}" = "git" ]; then
		REPO_STUFF="\$(git_prompt_info)\$(git_prompt_status)"
	else
		REPO_STUFF="\$(hg_prompt_info)\$(hg_prompt_status)"
	fi

	#PROMPT="%F{magenta}[%(!.%F{red}.%F{blue})%m : %F{green}%40<...<%~\$(git_prompt_info)\$(git_prompt_status)%F{magenta})%F{magenta}]%F{blue}%(!.#.$) %{$reset_color%}"
	PROMPT="%F{magenta}[%(!.%F{red}.%F{blue})%m : %F{green}%40<...<%~${REPO_STUFF}%F{magenta})%F{magenta}]%F{blue}%(!.#.$) %{$reset_color%}"

	ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} (%{$fg[yellow]%}${REPO}%{$reset_color%}:%{$fg[yellow]%}"
  	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  	ZSH_THEME_GIT_PROMPT_DIRTY=""
  	ZSH_THEME_GIT_PROMPT_CLEAN=""
	ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}●"
	ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
	ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜"
	ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}●"
else
	PROMPT="[%(!..)%m : %40<...<%~${REPO_STUFF})]%(!.#.$) "
	ZSH_THEME_GIT_PROMPT_PREFIX=" (${REPO}:"
  	ZSH_THEME_GIT_PROMPT_SUFFIX=""
  	ZSH_THEME_GIT_PROMPT_DIRTY=""
  	ZSH_THEME_GIT_PROMPT_CLEAN=""
	ZSH_THEME_GIT_PROMPT_ADDED="✚"
	ZSH_THEME_GIT_PROMPT_MODIFIED="●"
	ZSH_THEME_GIT_PROMPT_DELETED="✖"
	ZSH_THEME_GIT_PROMPT_RENAMED="➜"
	ZSH_THEME_GIT_PROMPT_UNMERGED="═"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="●"
fi

# Make hg use the same prompts as git
ZSH_THEME_HG_PROMPT_PREFIX=${ZSH_THEME_GIT_PROMPT_PREFIX}
ZSH_THEME_HG_PROMPT_SUFFIX=${ZSH_THEME_GIT_PROMPT_SUFFIX}
ZSH_THEME_HG_PROMPT_DIRTY=${ZSH_THEME_GIT_PROMPT_DIRTY}
ZSH_THEME_HG_PROMPT_CLEAN=${ZSH_THEME_GIT_PROMPT_CLEAN}
ZSH_THEME_HG_PROMPT_ADDED=${ZSH_THEME_GIT_PROMPT_ADDED}
ZSH_THEME_HG_PROMPT_MODIFIED=${ZSH_THEME_GIT_PROMPT_MODIFIED}
ZSH_THEME_HG_PROMPT_DELETED=${ZSH_THEME_GIT_PROMPT_DELETED}
ZSH_THEME_HG_PROMPT_RENAMED=${ZSH_THEME_GIT_PROMPT_RENAMED}



