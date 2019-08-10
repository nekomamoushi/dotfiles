#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

RED='\033[0;31m'
SUBL_PREFS_FILE="Preferences.sublime-settings"
SUBL_USER_PREFS_DIR="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"

log_error () {
    printf "%b[ERROR]%b %s  %s\n" "${RED}" "${RESET}" "$1"
}

if command -v "subl" &> /dev/null; then
    log_error "Please install sublime text"
fi

subl --command install_package_control

cp "${SUBL_PREFS_FILE}" "${SUBL_USER_PREFS_DIR}"
