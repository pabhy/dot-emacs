#!/bin/zsh

# Commentary:

# This script installs Rust and its related packages for linting and formatting.
# Emacs uses this installation for 'rust-mode'. Running this script with 'sudo'
# might not be required and should be executed as current user by default.

# Code:

RED="\033[0;31m"
ORANGE="\033[0;33m"
GREEN="\033[0;32m"
NC="\033[0m"

install_rust() {
    if [ -x "$(command -v rustc)" ]
    then
        echo "\n${ORANGE}Installing Rust: ${NC}\n"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustup component add rustfmt
        rustup component add rls
    fi
}

install_rust
