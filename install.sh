#!/bin/bash

# Get the current directory where the script is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Define the hidden directory where the binary will be installed
INSTALL_DIR="$HOME/.local/bin"

# Check if the pathfinder Python file exists
if [[ ! -f "$SCRIPT_DIR/pathfinder.py" ]]; then
  echo "Error: pathfinder.py not found in the current directory."
  exit 1
fi

# Create a virtual environment
python3 -m venv "$SCRIPT_DIR/venv"

# Activate the virtual environment
source "$SCRIPT_DIR/venv/bin/activate"

# Install pyinstaller within the virtual environment
echo "Script is not frozen!!!"
pip install pyinstaller

# Build the executable using pyinstaller with --onefile flag
pyinstaller --onefile "$SCRIPT_DIR/pathfinder.py"

# Deactivate the virtual environment after the build
deactivate

# Check if the executable is generated in the dist folder
if [[ ! -f "$SCRIPT_DIR/dist/pathfinder" ]]; then
  echo "Error: pathfinder binary not found after building."
  exit 1
fi

# Create the directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Move the pathfinder binary to the hidden directory
mv "$SCRIPT_DIR/dist/pathfinder" "$INSTALL_DIR/pathfinder"

# Set executable permissions for the binary
chmod +x "$INSTALL_DIR/pathfinder"

# Clean up by deleting the virtual environment and build/dist folders
rm -rf "$SCRIPT_DIR/venv" "$SCRIPT_DIR/build" "$SCRIPT_DIR/dist"

# Check if the install directory is already in the user's PATH
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
  # Instructions to update the PATH in .bashrc or .zshrc
  echo -e "\n\e[1;32mPATH update required!\e[0m"
  echo -e "\e[1;33mPlease add the following line to your shell configuration file (\~/.bashrc or \~/.zshrc):\e[0m"
  
  if [[ -f "$HOME/.bashrc" ]]; then
    echo -e "\e[1;36mexport PATH=\$PATH:$INSTALL_DIR\e[0m"
    echo -e "\e[1;33mTo update your PATH in .bashrc, you can run:\e[0m"
    echo -e "\e[1;36msource ~/.bashrc\e[0m"
  elif [[ -f "$HOME/.zshrc" ]]; then
    echo -e "\e[1;36mexport PATH=\$PATH:$INSTALL_DIR\e[0m"
    echo -e "\e[1;33mTo update your PATH in .zshrc, you can run:\e[0m"
    echo -e "\e[1;36msource ~/.zshrc\e[0m"
  else
    echo -e "\e[1;31mWarning: Neither .bashrc nor .zshrc found.\e[0m"
  fi
else
  echo -e "\e[1;32mNo need to modify your PATH. It's already set correctly.\e[0m"
fi

# Confirm successful installation
echo -e "\e[1;32mpathfinder has been successfully installed!\e[0m"

