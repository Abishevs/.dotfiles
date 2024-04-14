#!/bin/bash

echo "Enter the dir where you want to keep this repo:"
read DOTFILES_DIR

if [ -z "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
    echo "No input entered. Using default directory: $DOTFILES_DIR"
fi

DOTFILES_REPO="https://github.com/Abishevs/dotfiles.git"

# Ensure the script is run as a regular user and not root
if [ "$(id -u)" -eq 0 ]; then
    echo "This script should not be run as root" >&2
    exit 1
fi

# Check if Stow is installed and install it if not
if ! command -v stow &> /dev/null; then
    echo "Stow is not installed. Installing Stow..."
    sudo pacman -Syu stow --noconfirm
fi

# Clone the dotfiles repository if it's not already there
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone --recurse-submodules $DOTFILES_REPO $DOTFILES_DIR
else
    echo "Dotfiles directory already exists."
fi

cd $DOTFILES_DIR

# Stow all directories (each directory is a package)
for d in */ ; do
    echo "Stowing $d..."
    stow -v -R -t ~ $d
done

echo "Dotfiles are stowed successfully."
