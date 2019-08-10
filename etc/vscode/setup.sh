#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

RED='\033[0;31m'
VSCODE_PREFS_FILE="settings.json"
VSCODE_USER_PREFS_DIR="${HOME}/Library/Application Support/VSCodium/User"

log_error () {
    printf "%b[ERROR]%b %s  %s\n" "${RED}" "${RESET}" "$1"
}

if command -v "code" &> /dev/null; then
    log_error "Please install visual studio"
fi

for ext in $(cat extensions.txt); do
    code --install-extension "${ext}"
done

cp "${PREFS_FILE}" "${SUBL_USER_PREFS_DIR}"
