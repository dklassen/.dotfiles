#!/usr/bin/env bash

set -euo pipefail

function echo_info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

function echo_error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1" >&2
}

install_brew_package() {
    local package=$1
    if ! brew list "$package" &>/dev/null; then
        echo_info "Installing $package..."
        brew install "$package"
    else
        echo_info "$package is already installed. Skipping."
    fi
}

#####################################
# Homebrew setup and install base 
# packages.
# ####################################
if ! command -v brew &>/dev/null; then
    echo_info "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo_info "Homebrew is already installed. Skipping installation."
fi

eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || true

brew update

install_brew_package tig
install_brew_package ripgrep
install_brew_package fd

echo "Installing neovim files"
cp -R nvim/  ~/.config/nvim

cp .zshrc ~/.zshrc

cp -R bin/ ~/.bin




