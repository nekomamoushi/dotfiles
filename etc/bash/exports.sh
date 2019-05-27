
###############################################################################
# COMMON
###############################################################################

# Make `mvim` the default editor.
export EDITOR="vim"

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth

# Increase the maximum number of lines of history
# persisted in the history file (default value is 500).
export HISTFILESIZE=10000

# Don't add certain commands to the history file.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Increase the maximum number of commands recorded
# in the command history (default value is 500).
export HISTSIZE=10000

# Setting the timestamp format for the command history
export HISTTIMEFORMAT='%b %d %H:%M:%S: '

# Prefer US English and use UTF-8 encoding.
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Explicit
export PYTHONDONTWRITEBYTECODE=True

###############################################################################
# MACOS
###############################################################################

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Don't update when we install a package
export HOMEBREW_NO_AUTO_UPDATE=1
