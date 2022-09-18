#!/bin/zsh

# Commentary:

# This script installs pre-requisite packages required for running Emacs on
# Debian based systems.

# You do not need to execute this script explicitly. The 'install.sh' script
# should detect if you are using a Debian based system and automatically invoke
# this script if required.

# Code:

RED="\033[0;31m"
ORANGE="\033[0;33m"
GREEN="\033[0;32m"
NC="\033[0m"

PACKAGES=(
    curl
    pandoc
    cmake
    libtool
    libtool-bin
    ledger
)

install_packages() {
    PACKAGE_MANAGER="apt"
    echo "${ORANGE}Installing packages with ${PACKAGE_MANAGER}: ${NC}\n"
    $PACKAGE_MANAGER update
    for package in "${PACKAGES[@]}"
    do
        $PACKAGE_MANAGER install $package
    done
}

install_rust() {
    if ! -x "$(command -v apt)";
    then
        echo "\n${ORANGE}Installing Rust: ${NC}\n"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustup component add rustfmt
        rustup component add rls
    fi
}

install_packages
