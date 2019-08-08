#!/usr/bin/env bash

DOTFILES_DIRECTORY="${HOME}/.dotfiles_test"
DOTFILES_TARBALL_URL="https://github.com/nekomamoushi/dotfiles/tarball/master"

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0;37m'

SUCCESS_SYMBOL="✓"
ERROR_SYMBOL="✗"
WARNING_SYMBOL="⚠"
ARROW_SYMBOL="➜"

log () {
    printf "%s\n" "$1"
}

log_success () {
    printf "\r    [ %b%s%b ] %s\n" "${GREEN}" "${SUCCESS_SYMBOL}" "${RESET}" "$1"
}

log_warn () {
    printf "    [ %b%s%b ] %s\n" "${YELLOW}" "${WARNING_SYMBOL}" "${RESET}" "$1"
}

log_error () {
    printf "\r    [ %b%s%b ] %s\n" "${RED}" "${ERROR_SYMBOL}" "${RESET}" "$1"
}

log_result () {
    if [ "$1" = "0" ] ; then
        log_success "$2"
    else
        log_error "$2"
    fi
}

download() {
    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then
        curl -LsSo "$output" "$url" &> /dev/null
        return $?
    elif command -v "wget" &> /dev/null; then
        wget -qO "$output" "$url" &> /dev/null
        return $?
    fi

    return 1
}

download_dotfiles() {

    local tmp_file=""
    local dotfiles_url="${DOTFILES_TARBALL_URL}"
    local dotfiles_dir="${1-$DOTFILES_DIRECTORY}"
    # If ~ as part of the variable, expand to $HOME
    dotfiles_dir="${dotfiles_dir//\~/$HOME}"

    log "➜  Download Dotfiles"
    log "    URL: ${dotfiles_url}"
    log "    DIR: ${dotfiles_dir}"

    # Create temporary archive
    tmp_file="$(mktemp /tmp/XXXXX)"

    # Download dotfiles
    download "${dotfiles_url}" "${tmp_file}"
    log_result $? "Download dotfiles "

    # Create dotfiles directory
    mkdir -p "${dotfiles_dir}"

    # Extract archive in the `dotfiles` directory.
    tar -zxf "${tmp_file}" --strip-components 1 -C "${dotfiles_dir}"
    log_result $? "Extract dotfiles"

    # Delete temporary archive
    rm -rf "${tmp_file}"
}

main () {
    if [[ -z "$1" ]]; then
        download_dotfiles
    else
        download_dotfiles "$1"
    fi
}

# -----------------------------------------------------------------------------

main "$@"
