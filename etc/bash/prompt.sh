
BREW_PREFIX=$(brew --prefix)
BREW_GIT_PROMPT="${BREW_PREFIX}/opt/bash-git-prompt/share/gitprompt.sh"

[[ -f  "${BREW_GIT_PROMPT}" ]] && source "${BREW_GIT_PROMPT}"

