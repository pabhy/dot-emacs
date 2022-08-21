#!/usr/bin/zsh

# Commentary:

# This script installs the pre-requisite softwares that are required for the
# Emacs config to work correctly.

# On Debian based Linux distros like Ubuntu (latest version), packages are
# installed with 'apt' or 'snap'. If you get permission denied errors, try
# running the script with 'sudo' permissions.

# On Mac, packages are installed with 'brew'. If you do not have 'brew'
# installed, you should do that first before running this script.

# This script will try installing packages for other Linux distros with 'yum'
# but might encounter some issues which you might have to resolve manually.

# Other operating systems are not supported by this script, but you can refer to
# the packages that are installed by this script and install them manually on
# your system. Feel free to modify this script for your use-cases.

# Lastly, this script uses the 'zsh' shell and assumes that it is present on
# your system. You should probably think of switching to 'zsh' if you haven't
# already!

# Code:

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

packages=(pandoc cmake libtool libtool-bin ledger)

install_packages() {
    echo "${GREEN}Installing packages with:" $1 "${NC}\n"
    for package in "${packages[@]}"
    do
        $1 install $package
    done
    echo "\n${GREEN}All required packages for Emacs installed successfully!${NC}\n"
}

print_packages() {
    for package in "${packages[@]}"
    do
        echo "$package"
    done
}

if [[ "$OSTYPE" == "linux-gnu"* ]] && [ -x "$(command -v apt)" ]
then
    install_packages "apt"
elif [[ "$OSTYPE" == "linux-gnu"* ]] && [ -x "$(command -v yum)" ]
then
    install_packages "yum";
elif [[ "$OSTYPE" == "darwin"* ]]
then
    if ! [ -x "$(command -v brew)" ]
    then
        echo "${RED}Please install homebrew on your Mac before running this script.${NC}" >&2
        exit 1
    fi
    install_packages "brew"
else
    echo "${RED}Your system does not support 'apt' or 'yum' package managers, or they are not in PATH.${NC}" >&2
    echo "Please install the following packages manually:"
    print_packages
    exit 1
fi
