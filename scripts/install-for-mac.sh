#!/bin/zsh

# Commentary:

# This script installs pre-requisite packages required for running Emacs on
# MacOS.

# You do not need to execute this script explicitly. The 'install.sh' script
# should detect if you are using a Debian based system and automatically invoke
# this script if required.

# Code:

RED="\033[0;31m"
ORANGE="\033[0;33m"
GREEN="\033[0;32m"
NC="\033[0m"

PACKAGES=(
    # Make HTTP requests easier
    curl

    # Spell check dictionary
    aspell

    # Document support
    pandoc

    # Basic build tools
    cmake
    libtool
    libtool-bin

    # Package for double accounting
    ledger
)

install_packages() {
    PACKAGE_MANAGER="brew"
    echo "${ORANGE}Installing packages with ${PACKAGE_MANAGER}: ${NC}\n"
    $PACKAGE_MANAGER update
    for package in "${PACKAGES[@]}"
    do
        $PACKAGE_MANAGER install $package
    done
}

install_packages
