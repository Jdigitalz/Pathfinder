#!/bin/bash

# Define the hidden directory where the binary was installed
INSTALL_DIR="$HOME/.local/bin"
BINARY_NAME="pathfinder"
BINARY_PATH="$INSTALL_DIR/$BINARY_NAME"

# Check if the binary exists in the installation directory
if [[ ! -f "$BINARY_PATH" ]]; then
  echo "Error: $BINARY_NAME not found in $INSTALL_DIR."
  exit 1
fi

# Remove the pathfinder binary
echo -e "\n\e[1;31mRemoving $BINARY_NAME from $INSTALL_DIR...\e[0m"
rm "$BINARY_PATH"

# Check if the PATH update is in .bashrc or .zshrc and remove it
if [[ -f "$HOME/.bashrc" ]]; then
  echo -e "\e[1;32mRemoving PATH update from .bashrc...\e[0m"
  sed -i '/.local\/bin/d' "$HOME/.bashrc"
  echo -e "\e[1;33mChanges to .bashrc have been made.\e[0m"
elif [[ -f "$HOME/.zshrc" ]]; then
  echo -e "\e[1;32mRemoving PATH update from .zshrc...\e[0m"
  sed -i '/.local\/bin/d' "$HOME/.zshrc"
  echo -e "\e[1;33mChanges to .zshrc have been made.\e[0m"
else
  echo -e "\e[1;31mWarning: Neither .bashrc nor .zshrc found. No changes made.\e[0m"
fi

# Clean up the build, dist, and venv directories if they still exist
echo -e "\n\e[1;31mCleaning up remaining directories...\e[0m"
rm -rf "$HOME/pathfinder/venv" "$HOME/pathfinder/build" "$HOME/pathfinder/dist"

# Confirm successful uninstallation
echo -e "\n\e[1;32mUninstallation complete. The $BINARY_NAME binary has been removed.\e[0m"

