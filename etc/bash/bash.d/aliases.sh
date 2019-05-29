
###############################################################################
# COMMON
###############################################################################

if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias ll="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

# Shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias godl='cd ~/Downloads'
alias godesk='cd ~/Desktop'
alias gop='cd ~/Projects'

# Colored grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# History
alias h='history'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Display bash options settings
alias show_options='shopt'

# Date
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\\/]*\\//--/g' -e 's/^/ /' -e 's/-/|/'"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | copy && echo '=> Public key copied to pasteboard.'"

# Start a webserver, also accepts a port as optional argument
alias server='python3 -m http.server'

# Delete all compiled python
alias pyclean='find . -name "*.pyc" -exec rm -f {} \;'

###############################################################################
# MACOS
###############################################################################

alias dsclean='find . -name ".DS_Store" -exec rm -f {} \;'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
