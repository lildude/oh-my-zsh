# get the name of the branch we are on
function hg_prompt_info() {
  ref=$(hg branch 2> /dev/null) || return
  echo "$ZSH_THEME_HG_PROMPT_PREFIX${ref}$(parse_hg_dirty)$ZSH_THEME_HG_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_hg_dirty() {
  if [[ -n $(hg status 2> /dev/null) ]]; then
    echo "$ZSH_THEME_HG_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_HG_PROMPT_CLEAN"
  fi
}

# Get the status of the working tree
hg_prompt_status() {
  INDEX=$(hg status 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep '^? ' &> /dev/null); then
    STATUS="$ZSH_THEME_HG_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
    STATUS="$ZSH_THEME_HG_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M ' &> /dev/null); then
    STATUS="$ZSH_THEME_HG_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R ' &> /dev/null); then	# This is for rename, delete
    STATUS="$ZSH_THEME_HG_PROMPT_RENAMED$STATUS"
  fi

  echo $STATUS
}
