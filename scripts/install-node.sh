#!/bin/zsh

# Commentary:

# This script installs Node using Node Version Manager (NVM) and its related packages like Typescript.
# Emacs uses this installation for 'web-mode'. Running this script with 'sudo'
# might not be required and should be executed as current user by default.

# Code:

RED="\033[0;31m"
ORANGE="\033[0;33m"
GREEN="\033[0;32m"
NC="\033[0m"

install_nvm() {
    echo "\n${ORANGE}Installing NVM: ${NC}\n"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

install_node() {
    if ! [ -x "$(command -v node)" ]
    then
        install_nvm
        echo "\n${ORANGE}Installing Node and Typescript: ${NC}\n"
        nvm install node
        npm install -g typescript
    fi
}

# Entry point
install_node
