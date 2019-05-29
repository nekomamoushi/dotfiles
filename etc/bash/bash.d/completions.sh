
# HOMEBREW GIT COMPLETION
GIT_COMPLETION_SCRIPT="$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
[ -f  "${GIT_COMPLETION_SCRIPT}" ] && source "${GIT_COMPLETION_SCRIPT}"

# HOMEBREW GIT COMPLETION
BREW_COMPLETION_SCRIPT="$(brew --prefix)/etc/bash_completion.d/brew"
[ -f  "${BREW_COMPLETION_SCRIPT}" ] && source "${BREW_COMPLETION_SCRIPT}"

# HOMEBREW GIT COMPLETION
MAS_COMPLETION_SCRIPT="$(brew --prefix)/etc/bash_completion.d/mas"
[ -f  "${MAS_COMPLETION_SCRIPT}" ] && source "${MAS_COMPLETION_SCRIPT}"

# HOMEBREW GIT COMPLETION
MCLI_COMPLETION_SCRIPT="$(brew --prefix)/etc/bash_completion.d/m"
[ -f  "${MCLI_COMPLETION_SCRIPT}" ] && source "${MCLI_COMPLETION_SCRIPT}"
