alias a='alias'

a -g DEVNULL="> /dev/null 2>&1"

if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

# List all files colorized in long format
a l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
a ll="ls -laF ${colorflag}"

# List only directories
a lsd="ls -lF ${colorflag} | grep --color=never '^d'"

a cp='cp -iv'
a mv='mv -iv'
a mkdir='mkdir -pv'

# Shortcuts
a godl='cd ~/Downloads'
a godesk='cd ~/Desktop'

a grep='grep --color=auto'
a fgrep='fgrep --color=auto'
a egrep='egrep --color=auto'

a h='history'

# Date
a now='date +"%T"'
a nowdate='date +"%d-%m-%Y"'

# Pipe my public key to my clipboard.
a pubkey="more ~/.ssh/id_rsa.pub | copy && echo '=> Public key copied to pasteboard.'"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Python
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Start a webserver, also accepts a port as optional argument
a server='python3 -m http.server'

a pipi='sudo pip3 install'
a pips='pip3 search'
a pipl='pip3 list'
a pipu='sudo pip3 uninstall'

alias pyclean='find . -name "*.pyc" -exec rm -f {} \;'

# Pipenv
export PIPENV_SHELL_FANCY=True # Problem with pipenv shell and bash prompt

a p='pipenv'
a p.install='pipenv install'
a p.as_package="pipenv install --dev '-e .'"
a p.uninstall='pipenv uninstall'
a p.update='pipenv update'
a p.outdated='pipenv update --outdated'
a p.shell='pipenv shell'
a p.run='pipenv run python'
