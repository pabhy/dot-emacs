#!/bin/zsh

# Commentary:

# This script installs the pre-requisite softwares that are required for the
# Emacs config to work correctly.

# On Debian based Linux distros like Ubuntu (latest version), it will invoke the
# 'install-for-debian.sh' script and packages are installed with 'apt' or
# 'snap'. If you get permission denied errors, try running the script with
# 'sudo' permissions.

# On Mac, this script will invoke the 'install-for-mac.sh' script and packages
# are installed with 'brew'. If you do not have 'brew' installed, you should do
# that first before running this script.

# This script requires 'zsh' shell and assumes that it is present on your
# system. In my opinion, you should probably think of switching to 'zsh' if you
# haven't already!

# Code:

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

# Entry point
echo "\n${GREEN}:: Emacs Prerequisite Packages Installer ::${NC}\n"

if [[ "$OSTYPE" == "linux-gnu"* ]] && [ -x "$(command -v apt)" ]
then
    ./scripts/install-for-debian.sh
elif [[ "$OSTYPE" == "darwin"* ]]
then
    if ! [ -x "$(command -v brew)" ]
    then
        echo "${RED}Please install ${GREEN}homebrew{RED} on your Mac before running this script.${NC}" >&2
        exit 1
    fi
    ./scripts/install-for-mac.sh
else
    echo "${RED}This script currently does not support the system that you are using for installing Emacs prerequisite packages${NC}" >&2
    echo "Please install the packages manually."
    exit 1
fi

if [[ $? -eq 0 ]]
then
    echo "\n${GREEN}All required packages for Emacs are installed successfully!${NC}\n"
fi
