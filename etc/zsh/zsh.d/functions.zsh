# shellcheck disable=SC2005
# shellcheck disable=SC2148

# tput_colors - Demonstrate color combinations.
function display_colors()
{
    for fg_color in {0..7}; do
        set_foreground=$(tput setaf $fg_color)
        for bg_color in {0..7}; do
            set_background=$(tput setab $bg_color)
            echo -n "$set_background$set_foreground"
            printf ' F:%s B:%s ' $fg_color $bg_color
        done
        echo "$(tput sgr0)"
    done
}

function lowertr () { echo "$1" | tr '[:upper:]' '[:lower:]' ; }
function uppertr () { echo "$1" | tr '[:lower:]' '[:upper:]' ; }

function zipfolder() { zip -r "$1".zip "$1" ; }                # zipfolder = To create a ZIP archive of a folder
function tarfolder() { tar cvf "${1%%/}.tar"     "${1%%/}/"; } # tarfolder = To create a TAR archive of a folder
function tgzfolder() { tar cvf "${1%%/}.tar.gz"  "${1%%/}/"; } # tgzfolder = To create a TGZ archive of a folder
function bz2folder() { tar cvf "${1%%/}.tar.bz2" "${1%%/}/"; } # bz2folder = To create a BZ2 archive of a folder

function extract ()
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

# Makes new Dir and jumps inside
function md() {
    mkdir -p "$1" && cd "$1" && return 0
}

# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
function man() {
  env \
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    man "$@"
}
