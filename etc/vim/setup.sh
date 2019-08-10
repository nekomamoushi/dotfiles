#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

RED='\033[0;31m'

log_error () {
    printf "%b[ERROR]%b %s  %s\n" "${RED}" "${RESET}" "$1"
}

if command -v "vim" &> /dev/null; then
    log_error "Please install vim"
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
