#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"

echo "Setting up nvim config..."

if [ -e "$NVIM_CONFIG" ] && [ ! -L "$NVIM_CONFIG" ]; then
    echo "Backing up existing config: ${NVIM_CONFIG}.bak"
    mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
fi

if [ -L "$NVIM_CONFIG" ]; then
    echo "Symlink already exists: $NVIM_CONFIG"
else
    ln -s "$DOTFILES_DIR/nvim" "$NVIM_CONFIG"
    echo "Created symlink: $NVIM_CONFIG -> $DOTFILES_DIR/nvim"
fi

echo "Done!"
