#!/bin/bash

echo "Installing Claude AI Assistant Linux"
echo "------------------------------------"
echo

if command -v apt >/dev/null 2>&1; then
    echo "Ubuntu/Debian detected"
    sudo apt update
    sudo apt install -y npm

elif command -v dnf >/dev/null 2>&1; then
    echo "Fedora/RHEL detected"
    sudo dnf install -y npm

elif command -v pacman >/dev/null 2>&1; then
    echo "Arch Linux detected"
    sudo pacman -Sy --noconfirm npm

elif command -v zypper >/dev/null 2>&1; then
    echo "openSUSE detected"
    sudo zypper install -y npm

elif command -v apk >/dev/null 2>&1; then
    echo "Alpine Linux detected"
    sudo apk add npm

elif command -v xbps-install >/dev/null 2>&1; then
    echo "Void Linux detected"
    sudo xbps-install -Sy npm

elif command -v emerge >/dev/null 2>&1; then
    echo "Gentoo detected"
    sudo emerge --ask=n net-libs/nodejs

elif command -v eopkg >/dev/null 2>&1; then
    echo "Solus detected"
    sudo eopkg install nodejs

else
    echo "Unsupported or unknown Linux distribution."
    echo "Please install Node.js and npm manually."
    exit 1
fi

echo
echo "Installation completed!"
echo

if command -v npm >/dev/null 2>&1; then
    echo "npm was installed successfully."
    echo "npm version:"
    npm --version
else
    echo "Error: npm could not be installed."
    exit 1
fi