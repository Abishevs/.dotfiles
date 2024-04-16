#!/bin/bash

echo "Enter the directory where you want to keep this repo (default is $HOME/.dotfiles):"
read DOTFILES_DIR
if [ -z "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
    echo "No input entered. Using default directory: $DOTFILES_DIR"
fi

if [ "$(id -u)" -eq 0 ]; then
    echo "This script should not be run as root." >&2
    exit 1
fi

if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed. Installing Stow..."
    sudo pacman -Syu stow --noconfirm  
fi

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone --recurse-submodules https://github.com/Abishevs/dotfiles.git "$DOTFILES_DIR"
else
    echo "Dotfiles directory already exists. Updating repository..."
    (cd "$DOTFILES_DIR" && git pull && git submodule update --init --recursive)
fi

cd "$DOTFILES_DIR"

echo "Available branches:"
git branch -a | grep remotes | grep -v HEAD | grep -v master | sed 's/.*\///'
echo "Enter the branch you want to use (default is master):"
read BRANCH_U
if [ -z "$BRANCH_U" ]; then
    BRANCH_U="master"
fi
echo "Switching to branch $BRANCH_U..."
git checkout $BRANCH_U

./setup-zsh.sh # Setup zsh before stowing


for d in */ ; do
    if [ -d "$d" ]; then
        echo "Stowing $d..."
        stow -v -R -t ~ $d
    fi
done

echo "Dotfiles are stowed successfully."

