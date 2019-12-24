# Open vscode
c() {
  if [ $# -eq 0 ]; then
    code .
  else
    code "$1"
  fi
}

# Open sublime text
s() {
  if [ $# -eq 0 ]; then
    subl .
  else
    subl "$1"
  fi
}

# Open vim
v() {
  if [ $# -eq 0 ]; then
    vim .
  else
    vim "$1"
  fi
}

lowertr () { echo "$1" | tr '[:upper:]' '[:lower:]' ; }
uppertr () { echo "$1" | tr '[:lower:]' '[:upper:]' ; }

# To create a ZIP archive of a folder
zipfolder() { zip -r "$1".zip "$1" ; }

# To create a TAR archive of a folder
tarfolder() { tar cvf "${1%%/}.tar"     "${1%%/}/"; }

#To create a TGZ archive of a folder
tgzfolder() { tar cvf "${1%%/}.tar.gz"  "${1%%/}/"; }

# To create a BZ2 archive of a folder
bz2folder() { tar cvf "${1%%/}.tar.bz2" "${1%%/}/"; }

# Extract archives
extract ()
{
    if [ -f "$1" ] ; then
        case $1 in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Enhanced man
man() {
    env \
    LESS_TERMCAP_md=$'\e[1;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;40;92m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    man "$@"
}

# To start a HTTP server on port 8000 (default)
serve() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python3 -m http.server
}

# Syntax-highlight JSON strings or files
derulo() {
    if [ -t 0 ]; then # argument
        python3 -m json.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python3 -m json.tool | pygmentize -l javascript;
    fi;
}

# Go back to git root
rootup() {
    git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
    if [ ! -z "${git_dir}" ] ; then
        cd ${git_dir}
    fi
}

# Use Mac OS Preview to open a man page in a more handsome format
manp() {
    man -t $1 | open -f -a /Applications/Preview.app
}
