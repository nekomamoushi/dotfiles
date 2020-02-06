# Display bash options settings
alias show_options='setopt'

# -----------------------------------------------------------------------------
# COMMON
# -----------------------------------------------------------------------------

# Lists all files using exa in long format
alias ls="exa -l"

# List all files colorized in long format, including dot files
alias ll="exa -la"

# Secure command
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

# Colored grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# History
alias h='history'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\\/]*\\//--/g' -e 's/^/ /' -e 's/-/|/'"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | copy && echo '=> Public key copied to pasteboard.'"

# -----------------------------------------------------------------------------
# SHORTCUTS
# -----------------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias godl='cd ~/Downloads'
alias godesk='cd ~/Desktop'
alias gop='cd ~/Projects'
alias godot='cd ~/.dotfiles'

# -----------------------------------------------------------------------------
# BREW
# -----------------------------------------------------------------------------

alias bin='brew install'
alias bun='brew uninstall'
alias bupd='brew update'
alias bupg='brew upgrade'
alias bout='brew outdated'

# -----------------------------------------------------------------------------
# MACOS
# -----------------------------------------------------------------------------

alias o='open'
alias dsclean='find . -name ".DS_Store" -exec rm -f {} \;'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# -----------------------------------------------------------------------------
# NODE
# -----------------------------------------------------------------------------

# Local
alias ni="npm install"
alias nid="npm install --save-dev"
alias nu="npm uninstall"
alias nl="npm list"
alias nout="npm outdated"

# Global
alias ngi="npm install -g"
alias ngu="npm uninstall -g"
alias ngl="npm list -g --depth 0"
alias ngout="npm outdated -g"

