#!/usr/bin/env bash

DOTFILES_DIRECTORY="${HOME}/.dotfiles"
DOTFILES_TARBALL_URL="https://github.com/nekomamoushi/dotfiles/tarball/master"

FILES_TO_SYMLINK=(
    "etc/shell/bash/bashrc"
    "etc/shell/bash/inputrc"
    "etc/shell/zsh/zshenv"
    "etc/shell/zsh/zshrc"
    "etc/git/gitattributes"
    "etc/git/gitconfig"
    "etc/git/gitignore"
    "etc/vim/vimrc"
)

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'

SUCCESS_SYMBOL="✓"
ERROR_SYMBOL="✗"
WARNING_SYMBOL="⚠"
ARROW_SYMBOL="➜"
INFO_SYMBOL="i"

log () {
    printf "%s\n" "$1"
}

log_info () {
    printf "    [ %b%s%b ] %s\n" "${BLUE}" "${INFO_SYMBOL}" "${RESET}" "$1"
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

symlink () {
    local source_path="$1"
    local target_path="$2"

    ln -s "${source_path}" "${target_path}" &> /dev/null
}

download_dotfiles() {

    local tmp_file=""
    local dotfiles_url="${DOTFILES_TARBALL_URL}"
    local install_dir="${1-$DOTFILES_DIRECTORY}"
    # If ~ as part of the variable, expand to $HOME
    install_dir="${install_dir//\~/$HOME}"

    log "➜  Download Dotfiles"
    log_info "dotfiles_url: ${dotfiles_url}"
    log_info "install_dir: ${install_dir}"

    # Create temporary archive
    tmp_file="$(mktemp /tmp/XXXXX)"

    # Download dotfiles
    download "${dotfiles_url}" "${tmp_file}"
    log_result $? "Download dotfiles"

    # Create dotfiles directory
    mkdir -p "${install_dir}"

    # Extract archive in the `dotfiles` directory.
    tar -zxf "${tmp_file}" --strip-components 1 -C "${install_dir}"
    log_result $? "Install dotfiles"

    # Delete temporary archive
    rm -rf "${tmp_file}"
}

symlink_dotfiles () {

    local dotfiles_dir="${1-$DOTFILES_DIRECTORY}"
    dotfiles_dir="${dotfiles_dir//\~/$HOME}"

    log "➜ Symlink Dotfiles"

    for file in "${FILES_TO_SYMLINK[@]}"; do
        target_filename="${HOME}/.$(basename "${file}")"
        source_filename="${dotfiles_dir}/${file}"

        # Symlink dotfiles
        symlink "${source_filename}" "${target_filename}"
        log_result $? "Symlink: ${target_filename} -> ${source_filename}"
    done
}

main () {
    if [[ -z "$1" ]]; then
        download_dotfiles
        symlink_dotfiles
    else
        download_dotfiles "$1"
        symlink_dotfiles "$1"
    fi
}

# -----------------------------------------------------------------------------

main "$@"
