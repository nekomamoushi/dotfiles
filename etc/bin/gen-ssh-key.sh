#!/usr/bin/env bash

DEFAULT_SSH_DIR="${HOME}/.ssh"
DEFAULT_RSA_KEY_NAME='id_rsa'
DEFAULT_HOST="*"

read -p 'Input key name (default: id_rsa): ' RSA_KEY_NAME
read -p 'Input email for ssh key: ' USER_MAIL
read -p 'Input passphrase for ssh key: ' PASSPHRASE
read -p 'Input host for ssh key (default: *): ' HOST

[ -z "${RSA_KEY_NAME}" ] && RSA_KEY_NAME=${DEFAULT_RSA_KEY_NAME}
[ -z "${HOST}" ] && HOST=${DEFAULT_HOST}

echo "Generating ssh key ..."
ssh-keygen -t rsa -b 4096 -C "${USER_MAIL}" -f "${DEFAULT_SSH_DIR}/${RSA_KEY_NAME}" -N "${PASSPHRASE}"

echo "Adding ssh key to ssh agent"
eval "$(ssh-agent -s)"

# use ssh-agent to securely save your passphrase
# so I don't have to re-enter it.
ssh-add -K "${DEFAULT_SSH_DIR}/${RSA_KEY_NAME}"

# you will need to modify your ~/.ssh/config file to automatically load keys into the ssh-agent
# and store passphrases in your keychain
echo "Writing osx specific settings to ssh config... "
cat <<EOT >> ~/.ssh/config
Host ${HOST}
	AddKeysToAgent yes
	UseKeychain yes
	IdentityFile ${DEFAULT_SSH_DIR}/${RSA_KEY_NAME}
EOT
