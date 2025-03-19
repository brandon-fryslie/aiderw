#!/bin/bash

# Define the target directory, respecting the XDG standard if set
TARGET_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Define the source and target for the symlink
SOURCE_SCRIPT="$(pwd)/aiderw"
TARGET_SCRIPT="$TARGET_DIR/aiderw"

# Create the symlink
ln -sf "$SOURCE_SCRIPT" "$TARGET_SCRIPT"

# Log the actions
echo "Symlink created: $TARGET_SCRIPT -> $SOURCE_SCRIPT"

# Print instructions for setting up an alias
echo "To set up an alias, add the following line to your shell's configuration file (e.g., ~/.bashrc or ~/.zshrc):"
echo "alias aider='aiderw'"
echo "Then, reload your shell configuration or restart your terminal."
