#!/usr/bin/env bash

BASHRC_LOCAL="${HOME}/.bashrc.local"
VENV_CONFIG="
WORKON_HOME=\"\${HOME}/.virtualenvs\"
VIRTUALENVWRAPPER_PYTHON=\"/usr/local/bin/python3\"
"

install_tools() {
    pip3 install -U virtualenv virtualenvwrapper pew
}

if [ ! -e "${BASHRC_LOCAL}" ]; then
    touch "${BASHRC_LOCAL}"
fi

printf "%s" "${VENV_CONFIG}" >> "${BASHRC_LOCAL}"
