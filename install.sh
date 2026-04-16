#!/usr/bin/env bash

# Install icons fonts
if fc-list | grep -qi "JetBrainsMono Nerd Font"; then
  echo "Nerd Font already installed, skipping."
  exit 0
fi

echo "Installing JetBrainsMono Nerd Font..."
mkdir -p ~/.local/share/fonts
curl -fLo /tmp/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv
echo "Done! Restart your terminal, then open nvim."
# /END Install icons fonts
